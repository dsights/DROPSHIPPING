#!/usr/bin/env bash
# ============================================================
# Create New Dropshipping Store (Niche)
# Usage: ./create_store.sh <niche_slug> <store_name> <domain> <brand_voice> <categories_comma_sep> <keywords_comma_sep>
# Example: ./create_store.sh "fitness" "FitGear" "fitgear.com.au" "Energetic and motivating" "Gym Wear,Supplements" "fitness gear australia"
# ============================================================
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$ROOT/config.json"
PYTHON="$ROOT/venv/bin/python3"
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'

ok()  { echo -e "${GREEN}  ✓ $*${NC}"; }
inf() { echo -e "${YELLOW}  → $*${NC}"; }
err() { echo -e "${RED}  ✗ $*${NC}"; }
hdr() { echo ""; echo -e "${GREEN}── $* ──${NC}"; }

if [ "$#" -lt 6 ]; then
    echo "Usage: $0 <niche_slug> <store_name> <domain> <brand_voice> <categories> <keywords>"
    echo "Example: $0 fitness 'FitGear' fitgear.com.au 'Energetic' 'Gym Wear,Weights' 'fitness gear'"
    exit 1
fi

NICHE_SLUG="$1"
STORE_NAME="$2"
DOMAIN="$3"
BRAND_VOICE="$4"
CATEGORIES="$5"
KEYWORDS="$6"
MIN_PRICE="20"
MAX_PRICE="200"

DB_NAME="wp_$NICHE_SLUG"
DB_USER="wpuser"
DB_PASS="WpLocal2024!"
MYSQL_ROOT_PASS="DropShipRoot2024!"
WP_PATH="/var/www/html/$NICHE_SLUG"
WP_ADMIN="admin"
WP_ADMIN_PASS="Admin@Local2024!"
WP_EMAIL="dsightstech@gmail.com"
WP_URL="http://localhost/$NICHE_SLUG"

hdr "Creating new store: $STORE_NAME ($NICHE_SLUG)"

# ── 1. Create MariaDB Database ──────────────────────────────────────────────
inf "Creating database $DB_NAME..."
mysql -u root -p"$MYSQL_ROOT_PASS" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -p"$MYSQL_ROOT_PASS" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
mysql -u root -p"$MYSQL_ROOT_PASS" -e "FLUSH PRIVILEGES;"
ok "Database created"

# ── 2. Download & Install WordPress ─────────────────────────────────────────
inf "Installing WordPress at $WP_PATH..."
sudo mkdir -p "$WP_PATH"
sudo chown -R dsights:www-data "$WP_PATH"
cd "$WP_PATH"

if ! wp core is-installed --allow-root 2>/dev/null; then
    wp core download --allow-root
    wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --allow-root
    wp core install --url="$WP_URL" --title="$STORE_NAME" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_EMAIL" --skip-email --allow-root
    ok "WordPress installed"
else
    ok "WordPress already installed"
fi

wp option update timezone_string "Australia/Sydney" --allow-root
wp option update date_format "d/m/Y" --allow-root
wp option update time_format "g:i a" --allow-root
wp language core install en_AU --activate --allow-root

# ── 3. Install & Activate Plugins ───────────────────────────────────────────
inf "Installing plugins..."
PLUGINS="woocommerce wordpress-seo woo-variation-swatches mailchimp-for-woocommerce really-simple-ssl wp-super-cache contact-form-7"
for plugin in $PLUGINS; do
    wp plugin install "$plugin" --activate --allow-root --quiet || true
done
ok "Plugins installed"

# ── 4. Configure WooCommerce ────────────────────────────────────────────────
inf "Configuring WooCommerce..."
wp option update woocommerce_store_address "1 Collins Street" --allow-root
wp option update woocommerce_store_city "Melbourne" --allow-root
wp option update woocommerce_default_country "AU:VIC" --allow-root
wp option update woocommerce_store_postcode "3000" --allow-root
wp option update woocommerce_currency "AUD" --allow-root
wp option update woocommerce_weight_unit "kg" --allow-root
wp option update woocommerce_dimension_unit "cm" --allow-root

# Enable REST API
wp option update woocommerce_api_enabled "yes" --allow-root
wp rewrite structure '/%postname%/' --allow-root
wp rewrite flush --allow-root

# Create categories
IFS=',' read -ra CAT_ARRAY <<< "$CATEGORIES"
for cat in "${CAT_ARRAY[@]}"; do
    wp term create product_cat "$cat" --allow-root || true
done
ok "WooCommerce configured"

# ── 5. Create Apache VHost ──────────────────────────────────────────────────
inf "Configuring Apache VHost..."
VHOST_FILE="/etc/apache2/sites-available/$NICHE_SLUG.conf"
sudo bash -c "cat > $VHOST_FILE" <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot $WP_PATH
    ServerName localhost
    Alias /$NICHE_SLUG $WP_PATH

    <Directory $WP_PATH>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${NICHE_SLUG}_error.log
    CustomLog \${APACHE_LOG_DIR}/${NICHE_SLUG}_access.log combined
</VirtualHost>
EOF
sudo a2ensite "$NICHE_SLUG" >/dev/null
sudo systemctl reload apache2
ok "Apache VHost created and loaded"

# ── 6. Set File Permissions ─────────────────────────────────────────────────
inf "Setting file permissions..."
sudo chown -R dsights:www-data "$WP_PATH"
sudo chmod -R 775 "$WP_PATH"
sudo chmod 640 "$WP_PATH/wp-config.php"
ok "Permissions set"

# ── 7. Generate API Keys ────────────────────────────────────────────────────
inf "Generating WP Application Password..."
APP_PASS=$(wp eval '
$user = get_user_by("login", "admin");
if (!$user) { echo "ERROR"; exit; }
$result = WP_Application_Passwords::create_new_application_password($user->ID, ["name" => "Dropship Bot"]);
if (is_wp_error($result)) { echo "ERROR"; exit; }
echo $result[0];
' --allow-root 2>/dev/null)
ok "WP Application Password generated"

inf "Generating WooCommerce REST API keys..."
WOO_KEYS=$(wp eval '
require_once(ABSPATH . "wp-includes/pluggable.php");
$consumer_key    = "ck_" . wc_rand_hash();
$consumer_secret = "cs_" . wc_rand_hash();
global $wpdb;
$wpdb->insert(
    $wpdb->prefix . "woocommerce_api_keys",
    [
        "user_id"         => 1,
        "description"     => "Dropship Bot",
        "permissions"     => "read_write",
        "consumer_key"    => wc_api_hash($consumer_key),
        "consumer_secret" => $consumer_secret,
        "truncated_key"   => substr($consumer_key, -7),
        "last_access"     => null,
    ]
);
echo $consumer_key . " " . $consumer_secret;
' --allow-root 2>/dev/null || echo "MANUAL MANUAL")

CK=$(echo "$WOO_KEYS" | awk '{print $1}')
CS=$(echo "$WOO_KEYS" | awk '{print $2}')
ok "WooCommerce API keys generated"

# ── 8. Add to config.json ───────────────────────────────────────────────────
inf "Updating config.json..."
"$PYTHON" - <<PYEOF
import json, sys

config_path = "$CONFIG"
with open(config_path) as f:
    cfg = json.load(f)

if "$NICHE_SLUG" not in cfg["niches"]:
    cfg["niches"]["$NICHE_SLUG"] = {}

niche_config = cfg["niches"]["$NICHE_SLUG"]
niche_config.update({
    "enabled": True,
    "store_name": "$STORE_NAME",
    "domain": "$DOMAIN",
    "local_wp_path": "$WP_PATH",
    "wp_content_path": "$WP_PATH/wp-content",
    "wp_url_local": "$WP_URL",
    "wp_url_live": "https://$DOMAIN",
    "wp_user": "$WP_ADMIN",
    "wp_app_password": "$APP_PASS",
    "woocommerce_consumer_key": "$CK",
    "woocommerce_consumer_secret": "$CS",
    "store_email": "hello@$DOMAIN",
    "brand_voice": "$BRAND_VOICE",
    "categories": [c.strip() for c in "$CATEGORIES".split(",")],
    "target_keywords": [k.strip() for k in "$KEYWORDS".split(",")],
    "supplier_urls": [
        "https://www.aliexpress.com/category/1/all.html",
        "https://www.dhgate.com/wholesale/all.html"
    ],
    "trending_sources": [
        "https://www.amazon.com.au/bestsellers"
    ],
    "target_margin_pct": 55,
    "min_price_aud": int("$MIN_PRICE"),
    "max_price_aud": int("$MAX_PRICE"),
    "shipping_requirement": "AU_LOCAL_OR_FAST",
    "fastcomet": {
        "host": "YOUR_FASTCOMET_SERVER_IP",
        "user": "YOUR_SSH_USER",
        "port": 22,
        "ssh_key": "/home/dsights/.ssh/fastcomet_${NICHE_SLUG}_rsa",
        "remote_wp_path": "/home/YOUR_USER/public_html_${NICHE_SLUG}",
        "remote_db_name": "YOUR_${NICHE_SLUG}_DB_NAME",
        "remote_db_user": "YOUR_${NICHE_SLUG}_DB_USER",
        "remote_db_pass": "YOUR_${NICHE_SLUG}_DB_PASS"
    },
    "social_media": {
        "tiktok_account": "@$NICHE_SLUG",
        "instagram_account": "@${NICHE_SLUG}.au",
        "pinterest_board": "$STORE_NAME Finds"
    }
})

with open(config_path, "w") as f:
    json.dump(cfg, f, indent=2)
print("  config.json updated")
PYEOF

# ── 9. Initialize Git Repo ──────────────────────────────────────────────────
inf "Initializing Git repository..."
cd "$WP_PATH"
if [ ! -d ".git" ]; then
    git init -q
    cat > .gitignore <<'GITIGNORE'
wp-config.php
wp-content/uploads/
wp-content/cache/
wp-content/upgrade/
*.log
.htaccess
GITIGNORE
    git add -A
    git commit -m "Initial WordPress commit" --author="Dropship Bot <bot@localhost>" -q || true
    ok "Git initialized at $WP_PATH"
fi

hdr "Setup Complete!"
echo "New store '$STORE_NAME' is ready."
echo "URL:       $WP_URL"
echo "Admin:     $WP_URL/wp-admin"
echo "Login:     $WP_ADMIN / $WP_ADMIN_PASS"
echo ""
echo "Next Steps:"
echo "1. Run fastcomet init (if live server is ready):"
echo "   ssh-keygen -t rsa -b 4096 -f ~/.ssh/fastcomet_${NICHE_SLUG}_rsa -N ''"
echo "2. Update config.json with specific supplier URLs for $NICHE_SLUG."
echo "3. Run scout to fetch products:"
echo "   $ROOT/venv/bin/python3 $ROOT/_common/scout.py $NICHE_SLUG"
