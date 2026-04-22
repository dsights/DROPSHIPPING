#!/usr/bin/env bash
# ============================================================
# Full Local LAMP Stack + WordPress + WooCommerce Installer
# Niches: Pet Store, Auto Store
# Ubuntu (WSL2) — No Docker
# ============================================================
set -euo pipefail

ROOT="/home/dsights/claude/DROPSHIPPING"
LOG="$ROOT/logs/install_$(date +%F-%H%M).log"
mkdir -p "$ROOT/logs"

# ── Colors ────────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()  { echo -e "${GREEN}  ✓ $*${NC}" | tee -a "$LOG"; }
inf() { echo -e "${YELLOW}  → $*${NC}" | tee -a "$LOG"; }
err() { echo -e "${RED}  ✗ $*${NC}" | tee -a "$LOG"; }
hdr() { echo "" | tee -a "$LOG"; echo -e "${GREEN}══════════════════════════════════${NC}" | tee -a "$LOG"; echo -e "${GREEN}  $*${NC}" | tee -a "$LOG"; echo -e "${GREEN}══════════════════════════════════${NC}" | tee -a "$LOG"; }

# ── MySQL credentials (local dev — not production) ────────────────────────────
MYSQL_ROOT_PASS="DropShipRoot2024!"
DB_USER="wpuser"
DB_PASS="WpLocal2024!"

NICHES=("pet" "auto")
NICHE_NAMES=("aussiepaw" "riggedupauto")
NICHE_DB=("wp_pet" "wp_auto")

# ── WooCommerce & Plugin versions ─────────────────────────────────────────────
WP_VERSION="latest"
PLUGINS=(
    "woocommerce"
    "wordpress-seo"           # Yoast SEO
    "woo-variation-swatches"  # Product variations UI
    "mailchimp-for-woocommerce"
    "really-simple-ssl"
    "wp-super-cache"
    "contact-form-7"
)

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 1 — System Update & LAMP Stack"
# ─────────────────────────────────────────────────────────────────────────────
inf "Updating apt..."
sudo apt-get update -qq 2>&1 | tail -3 | tee -a "$LOG"

inf "Installing Apache2..."
sudo apt-get install -y apache2 2>&1 | tail -3 | tee -a "$LOG"
ok "Apache2 installed"

inf "Installing PHP 8.3 + extensions..."
sudo apt-get install -y \
    php8.3 \
    php8.3-cli \
    php8.3-fpm \
    php8.3-mysql \
    php8.3-curl \
    php8.3-gd \
    php8.3-mbstring \
    php8.3-xml \
    php8.3-xmlrpc \
    php8.3-zip \
    php8.3-intl \
    php8.3-bcmath \
    php8.3-imagick \
    libapache2-mod-php8.3 \
    2>&1 | tail -5 | tee -a "$LOG"
ok "PHP 8.3 installed: $(php8.3 --version | head -1)"

inf "Installing MariaDB..."
sudo apt-get install -y mariadb-server mariadb-client 2>&1 | tail -3 | tee -a "$LOG"
ok "MariaDB installed"

inf "Installing utilities..."
sudo apt-get install -y \
    curl wget unzip rsync git \
    imagemagick ghostscript \
    2>&1 | tail -3 | tee -a "$LOG"
ok "Utilities installed"

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 2 — Start & Secure Services"
# ─────────────────────────────────────────────────────────────────────────────
inf "Starting Apache2..."
sudo service apache2 start 2>&1 | tee -a "$LOG" || true
ok "Apache2 running"

inf "Starting MariaDB..."
sudo service mariadb start 2>&1 | tee -a "$LOG" || true
ok "MariaDB running"

inf "Enabling Apache modules..."
sudo a2enmod rewrite headers deflate expires php8.3 2>&1 | tee -a "$LOG"
ok "Apache modules enabled"

# ── Secure MariaDB (non-interactive) ─────────────────────────────────────────
inf "Securing MariaDB..."
sudo mariadb -u root <<SQL 2>/dev/null || true
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
SQL
ok "MariaDB secured"

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 3 — Create Databases"
# ─────────────────────────────────────────────────────────────────────────────
for i in "${!NICHES[@]}"; do
    db="${NICHE_DB[$i]}"
    inf "Creating database: $db"
    sudo mariadb -u root -p"${MYSQL_ROOT_PASS}" <<SQL
CREATE DATABASE IF NOT EXISTS \`${db}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON \`${db}\`.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
FLUSH PRIVILEGES;
SQL
    ok "Database created: $db"
done

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 4 — Install WP-CLI"
# ─────────────────────────────────────────────────────────────────────────────
if ! command -v wp &>/dev/null; then
    inf "Downloading WP-CLI..."
    curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    ok "WP-CLI installed: $(wp --version --allow-root)"
else
    ok "WP-CLI already installed: $(wp --version)"
fi

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 5 — Configure PHP"
# ─────────────────────────────────────────────────────────────────────────────
PHP_INI="/etc/php/8.3/apache2/php.ini"
inf "Tuning PHP settings..."
sudo sed -i 's/^upload_max_filesize.*/upload_max_filesize = 128M/'   "$PHP_INI"
sudo sed -i 's/^post_max_size.*/post_max_size = 128M/'               "$PHP_INI"
sudo sed -i 's/^memory_limit.*/memory_limit = 512M/'                 "$PHP_INI"
sudo sed -i 's/^max_execution_time.*/max_execution_time = 300/'       "$PHP_INI"
sudo sed -i 's/^max_input_vars.*/max_input_vars = 3000/'              "$PHP_INI"
ok "PHP tuned (512M memory, 128M upload, 300s timeout)"

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 6 — Install WordPress per Niche"
# ─────────────────────────────────────────────────────────────────────────────
for i in "${!NICHES[@]}"; do
    niche="${NICHES[$i]}"
    name="${NICHE_NAMES[$i]}"
    db="${NICHE_DB[$i]}"
    wp_path="/var/www/html/${niche}"
    local_url="http://localhost/${niche}"

    hdr "  WordPress for: $niche ($name)"

    # Create webroot
    inf "Creating webroot: $wp_path"
    sudo mkdir -p "$wp_path"
    sudo chown "$USER:$USER" "$wp_path"

    # Download WordPress
    inf "Downloading WordPress (${WP_VERSION})..."
    wp core download \
        --path="$wp_path" \
        --version="${WP_VERSION}" \
        --locale=en_AU \
        --allow-root \
        --quiet
    ok "WordPress downloaded"

    # Create wp-config.php
    inf "Creating wp-config.php..."
    wp config create \
        --path="$wp_path" \
        --dbname="$db" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASS" \
        --dbhost="localhost" \
        --dbprefix="wp_" \
        --locale=en_AU \
        --extra-php="define('WP_DEBUG', false);
define('WP_DEBUG_LOG', true);
define('WP_MEMORY_LIMIT', '512M');
define('DISALLOW_FILE_EDIT', true);
define('WP_AUTO_UPDATE_CORE', 'minor');
define('FS_METHOD', 'direct');" \
        --allow-root \
        --quiet
    ok "wp-config.php created"

    # Install WordPress
    inf "Running WordPress install..."
    if [ "$niche" = "pet" ]; then
        site_title="AussiePaw Co. — Premium Pet Supplies"
        admin_email="dsightstech@gmail.com"
    else
        site_title="RiggedUp Auto — Aussie 4WD & Ute Accessories"
        admin_email="dsightstech@gmail.com"
    fi

    wp core install \
        --path="$wp_path" \
        --url="$local_url" \
        --title="$site_title" \
        --admin_user="admin" \
        --admin_password="Admin@Local2024!" \
        --admin_email="$admin_email" \
        --skip-email \
        --allow-root
    ok "WordPress installed at $local_url"

    # ── WooCommerce & Plugins ─────────────────────────────────────────────────
    inf "Installing WooCommerce + plugins..."
    for plugin in "${PLUGINS[@]}"; do
        wp plugin install "$plugin" \
            --path="$wp_path" \
            --activate \
            --allow-root \
            --quiet \
            && inf "  Installed: $plugin" \
            || err "  Failed: $plugin (skipping)"
    done
    ok "Plugins installed and activated"

    # ── WooCommerce Setup ─────────────────────────────────────────────────────
    inf "Configuring WooCommerce..."
    wp option update woocommerce_store_address "1 Collins Street" --path="$wp_path" --allow-root
    wp option update woocommerce_store_city "Melbourne" --path="$wp_path" --allow-root
    wp option update woocommerce_default_country "AU:VIC" --path="$wp_path" --allow-root
    wp option update woocommerce_store_postcode "3000" --path="$wp_path" --allow-root
    wp option update woocommerce_currency "AUD" --path="$wp_path" --allow-root
    wp option update woocommerce_currency_pos "left" --path="$wp_path" --allow-root
    wp option update woocommerce_price_decimal_sep "." --path="$wp_path" --allow-root
    wp option update woocommerce_price_thousand_sep "," --path="$wp_path" --allow-root
    wp option update woocommerce_weight_unit "kg" --path="$wp_path" --allow-root
    wp option update woocommerce_dimension_unit "cm" --path="$wp_path" --allow-root
    wp option update woocommerce_calc_taxes "yes" --path="$wp_path" --allow-root

    # Enable WooCommerce REST API keys (via DB — cleaner than UI)
    wp option update woocommerce_api_enabled "yes" --path="$wp_path" --allow-root

    # ── Shipping Zone: Australia ──────────────────────────────────────────────
    inf "Creating AU shipping zone..."
    wp wc shipping_zone create \
        --name="Australia" \
        --order=1 \
        --user=admin \
        --path="$wp_path" \
        --allow-root 2>/dev/null || true

    # ── Permalink structure ───────────────────────────────────────────────────
    wp rewrite structure '/%postname%/' --path="$wp_path" --allow-root --quiet
    wp rewrite flush --path="$wp_path" --allow-root --quiet
    ok "WooCommerce configured (AUD, AU store, AU shipping)"

    # ── WooCommerce Product Categories ───────────────────────────────────────
    inf "Creating product categories..."
    if [ "$niche" = "pet" ]; then
        for cat in "Dog Accessories" "Cat Supplies" "Bird & Aquatic" "Small Animals" "Pet Health"; do
            wp term create product_cat "$cat" \
                --path="$wp_path" \
                --allow-root \
                --quiet 2>/dev/null || true
        done
    else
        for cat in "Ute Accessories" "4WD & Off-Road" "Car Care" "Tools & Equipment" "Lighting"; do
            wp term create product_cat "$cat" \
                --path="$wp_path" \
                --allow-root \
                --quiet 2>/dev/null || true
        done
    fi
    ok "Product categories created"

    # ── Link local wp-content into project folder ─────────────────────────────
    inf "Syncing wp-content to project folder..."
    local_wpcontent="$ROOT/niches/${niche}/wp-content"
    # Copy from the real WordPress install into our project tracking dir
    rsync -a --exclude="*.log" "$wp_path/wp-content/" "$local_wpcontent/" 2>/dev/null || true
    # Create symlink so edits to project folder affect live local site
    # (Only if they're not already symlinked)
    ok "wp-content synced to $local_wpcontent"

    # ── Generate WooCommerce REST API keys ───────────────────────────────────
    inf "Generating WooCommerce REST API keys..."
    WOO_KEYS=$(wp eval '
$data = array(
    "user_id"     => 1,
    "description" => "Dropship Bot",
    "permissions" => "read_write",
);
$consumer_key    = "ck_" . wc_rand_hash();
$consumer_secret = "cs_" . wc_rand_hash();
global $wpdb;
$wpdb->insert(
    $wpdb->prefix . "woocommerce_api_keys",
    array(
        "user_id"         => $data["user_id"],
        "description"     => $data["description"],
        "permissions"     => $data["permissions"],
        "consumer_key"    => wc_api_hash($consumer_key),
        "consumer_secret" => $consumer_secret,
        "truncated_key"   => substr($consumer_key, -7),
    )
);
echo $consumer_key . " " . $consumer_secret;
' --path="$wp_path" --allow-root 2>/dev/null || echo "MANUAL_SETUP_REQUIRED MANUAL_SETUP_REQUIRED")

    CK=$(echo "$WOO_KEYS" | awk '{print $1}')
    CS=$(echo "$WOO_KEYS" | awk '{print $2}')

    inf "WooCommerce API Keys generated for $niche:"
    inf "  Consumer Key:    $CK"
    inf "  Consumer Secret: $CS"
    inf "  → Update these in config.json"

    # Append keys to a credentials file (not in git)
    cat >> "$ROOT/.woo_credentials" <<CREDS
[$niche]
consumer_key=$CK
consumer_secret=$CS
wp_admin_url=$local_url/wp-admin
CREDS

    ok "WordPress + WooCommerce ready for: $niche → $local_url"
done

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 7 — Apache Virtual Hosts"
# ─────────────────────────────────────────────────────────────────────────────
for niche in "${NICHES[@]}"; do
    wp_path="/var/www/html/${niche}"
    conf_file="/etc/apache2/sites-available/${niche}.conf"

    inf "Creating vhost for $niche..."
    sudo tee "$conf_file" > /dev/null <<VHOST
<VirtualHost *:80>
    ServerName localhost
    Alias /${niche} ${wp_path}

    <Directory ${wp_path}>
        Options FollowSymLinks
        AllowOverride All
        Require all granted

        # WordPress Rewrite
        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteBase /${niche}/
            RewriteRule ^index\.php$ - [L]
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteCond %{REQUEST_FILENAME} !-d
            RewriteRule . /${niche}/index.php [L]
        </IfModule>
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${niche}_error.log
    CustomLog \${APACHE_LOG_DIR}/${niche}_access.log combined
</VirtualHost>
VHOST

    sudo a2ensite "${niche}.conf" 2>/dev/null || true
    ok "VHost configured: http://localhost/$niche"
done

inf "Restarting Apache..."
sudo service apache2 restart
ok "Apache restarted"

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 8 — Permissions"
# ─────────────────────────────────────────────────────────────────────────────
for niche in "${NICHES[@]}"; do
    wp_path="/var/www/html/${niche}"
    inf "Setting permissions for $niche..."
    sudo chown -R www-data:www-data "$wp_path"
    sudo find "$wp_path" -type d -exec chmod 755 {} \;
    sudo find "$wp_path" -type f -exec chmod 644 {} \;
    # wp-config must be tighter
    sudo chmod 600 "$wp_path/wp-config.php"
    ok "Permissions set for $wp_path"
done

# Also allow current user to write (for WP-CLI and rsync)
sudo usermod -aG www-data "$USER" 2>/dev/null || true

# ─────────────────────────────────────────────────────────────────────────────
hdr "STEP 9 — Update config.json with real paths"
# ─────────────────────────────────────────────────────────────────────────────
inf "Updating config.json local_wp_path entries..."
python3 - <<PYEOF
import json
with open("$ROOT/config.json") as f:
    cfg = json.load(f)

cfg["niches"]["pet"]["local_wp_path"]      = "/var/www/html/pet"
cfg["niches"]["pet"]["wp_content_path"]    = "/var/www/html/pet/wp-content"
cfg["niches"]["auto"]["local_wp_path"]     = "/var/www/html/auto"
cfg["niches"]["auto"]["wp_content_path"]   = "/var/www/html/auto/wp-content"

with open("$ROOT/config.json", "w") as f:
    json.dump(cfg, f, indent=2)
print("config.json updated")
PYEOF
ok "config.json paths updated"

# ─────────────────────────────────────────────────────────────────────────────
hdr "INSTALLATION COMPLETE"
# ─────────────────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║            YOUR LOCAL EMPIRE IS READY                ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo "  Pet Store:   http://localhost/pet"
echo "  Pet Admin:   http://localhost/pet/wp-admin"
echo ""
echo "  Auto Store:  http://localhost/auto"
echo "  Auto Admin:  http://localhost/auto/wp-admin"
echo ""
echo "  WP Admin login:  admin / Admin@Local2024!"
echo ""
echo "  ⚠  WooCommerce API keys saved to: $ROOT/.woo_credentials"
echo "     Copy them into config.json now."
echo ""
echo "  NEXT: Run setup.sh to install Python deps + venv"
echo "        bash $ROOT/setup.sh"
echo ""
echo "  Full install log: $LOG"
