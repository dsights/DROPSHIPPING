#!/usr/bin/env bash
# ============================================================
# Post-Install Configurator
# Run AFTER install_stack.sh + setup.sh
# Auto-generates WP Application Passwords, WooCommerce API keys,
# and writes them into config.json + installs the crontab.
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

[ -f "$PYTHON" ] || { err "Run setup.sh first to create the Python venv"; exit 1; }
command -v wp &>/dev/null || { err "WP-CLI not found. Run install_stack.sh first."; exit 1; }

NICHES=("pet" "auto")
WP_PATHS=("/var/www/html/pet" "/var/www/html/auto")
DB_USER="wpuser"
DB_PASS="WpLocal2024!"
MYSQL_ROOT_PASS="DropShipRoot2024!"

# ── Ensure services are running ───────────────────────────────────────────────
hdr "Ensuring services are up"
sudo service apache2 start 2>/dev/null || true
sudo service mariadb start 2>/dev/null || true
ok "Apache2 + MariaDB running"

# ── Per-niche configuration ───────────────────────────────────────────────────
for i in "${!NICHES[@]}"; do
    niche="${NICHES[$i]}"
    wp_path="${WP_PATHS[$i]}"

    hdr "Configuring: $niche ($wp_path)"

    if [ ! -f "$wp_path/wp-config.php" ]; then
        err "WordPress not found at $wp_path — did install_stack.sh complete?"
        continue
    fi

    # ── Generate WP Application Password for REST API ─────────────────────────
    inf "Generating WordPress Application Password..."
    APP_PASS=$(wp eval '
$user = get_user_by("login", "admin");
if (!$user) { echo "ERROR"; exit; }
// Remove existing bot app passwords to avoid duplicates
$existing = WP_Application_Passwords::get_user_application_passwords($user->ID);
foreach ($existing as $app) {
    if ($app["name"] === "Dropship Bot") {
        WP_Application_Passwords::delete_application_password($user->ID, $app["uuid"]);
    }
}
$result = WP_Application_Passwords::create_new_application_password($user->ID, ["name" => "Dropship Bot"]);
if (is_wp_error($result)) { echo "ERROR: " . $result->get_error_message(); exit; }
// Result[0] is the plain-text password (only shown once)
echo $result[0];
' --path="$wp_path" --allow-root 2>/dev/null)

    if [[ "$APP_PASS" == ERROR* ]]; then
        err "App password generation failed: $APP_PASS"
        APP_PASS="GENERATE_MANUALLY_IN_WP_ADMIN"
    else
        ok "App password generated for $niche"
    fi

    # ── Generate WooCommerce REST API keys ────────────────────────────────────
    inf "Generating WooCommerce REST API keys..."
    WOO_KEYS=$(wp eval '
require_once(ABSPATH . "wp-includes/pluggable.php");
$consumer_key    = "ck_" . wc_rand_hash();
$consumer_secret = "cs_" . wc_rand_hash();
global $wpdb;
// Remove old bot keys
$wpdb->delete($wpdb->prefix . "woocommerce_api_keys", ["description" => "Dropship Bot"]);
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
' --path="$wp_path" --allow-root 2>/dev/null || echo "MANUAL_SETUP MANUAL_SETUP")

    CK=$(echo "$WOO_KEYS" | awk '{print $1}')
    CS=$(echo "$WOO_KEYS" | awk '{print $2}')

    if [[ "$CK" == MANUAL* ]]; then
        err "WooCommerce key generation failed — WooCommerce may not be active"
        CK="ck_GENERATE_IN_WOOCOMMERCE_SETTINGS"
        CS="cs_GENERATE_IN_WOOCOMMERCE_SETTINGS"
    else
        ok "WooCommerce API keys generated for $niche"
    fi

    # ── Write credentials into config.json ───────────────────────────────────
    inf "Updating config.json for $niche..."
    "$PYTHON" - <<PYEOF
import json, sys

with open("$CONFIG") as f:
    cfg = json.load(f)

n = cfg["niches"]["$niche"]
n["wp_app_password"]            = "$APP_PASS"
n["woocommerce_consumer_key"]   = "$CK"
n["woocommerce_consumer_secret"]= "$CS"

with open("$CONFIG", "w") as f:
    json.dump(cfg, f, indent=2)
print("  config.json updated")
PYEOF
    ok "config.json updated for $niche"

    # ── Print admin URL ───────────────────────────────────────────────────────
    echo ""
    echo "  $niche store:"
    echo "    URL:       http://localhost/$niche"
    echo "    Admin:     http://localhost/$niche/wp-admin"
    echo "    Login:     admin / Admin@Local2024!"
    echo "    App Pass:  $APP_PASS"
    echo "    Woo CK:    $CK"
    echo "    Woo CS:    $CS"
    echo ""
done

# ── Git init for each store ───────────────────────────────────────────────────
hdr "Initialising Git repos"
GITHUB_REPO=$(python3 -c "import json; c=json.load(open('$CONFIG')); print(c['github']['repo_url'])")

for wp_path in "${WP_PATHS[@]}"; do
    if [ -d "$wp_path" ]; then
        cd "$wp_path"
        if [ ! -d ".git" ]; then
            git init -q
            inf "Git init at $wp_path"
            # Create .gitignore for WordPress
            cat > .gitignore <<'GITIGNORE'
# WordPress sensitive files
wp-config.php
wp-content/uploads/
wp-content/cache/
wp-content/upgrade/
*.log
.htaccess
GITIGNORE
            git add -A
            git commit -m "Initial WordPress commit" \
                --author="Dropship Bot <bot@localhost>" -q 2>/dev/null || true
            ok "Git initialized at $wp_path"
        else
            ok "Git already initialized at $wp_path"
        fi

        if [[ "$GITHUB_REPO" != *YOUR_* ]]; then
            git remote add origin "$GITHUB_REPO" 2>/dev/null || \
            git remote set-url origin "$GITHUB_REPO"
            ok "Remote set: $GITHUB_REPO"
        else
            inf "GitHub remote not set — update github.repo_url in config.json first"
        fi
        cd "$ROOT"
    fi
done

# ── SSH key setup reminder ────────────────────────────────────────────────────
hdr "SSH Key Status"
for keyfile in ~/.ssh/fastcomet_pet_rsa ~/.ssh/fastcomet_auto_rsa; do
    if [ -f "$keyfile" ]; then
        ok "Found: $keyfile"
    else
        inf "Missing: $keyfile"
        inf "Generate with: ssh-keygen -t rsa -b 4096 -f $keyfile -N ''"
        inf "Then add $(basename $keyfile).pub content to FastComet SSH Manager"
    fi
done

# ── Install crontab ───────────────────────────────────────────────────────────
hdr "Crontab Installation"
CRON_BLOCK="# Dropshipping Empire
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
TZ=Australia/Sydney
0 4 * * * /bin/bash $ROOT/master.sh >> $ROOT/logs/cron_master.log 2>&1
45 8 * * * $PYTHON $ROOT/_common/report.py >> $ROOT/logs/cron_report.log 2>&1
0 3 * * 0 find $ROOT/logs -name '*.log' -mtime +30 -delete
0 3 * * 0 find $ROOT/db -name '*.sql' -mtime +14 -delete"

# Check if already installed
if crontab -l 2>/dev/null | grep -q "Dropshipping Empire"; then
    ok "Crontab already installed"
else
    (crontab -l 2>/dev/null; echo "$CRON_BLOCK") | crontab -
    ok "Crontab installed — runs daily at 04:00 AEST"
fi

inf "Verify with: crontab -l"

# ── Final summary ─────────────────────────────────────────────────────────────
hdr "Post-Install Complete"
echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║         EMPIRE FULLY CONFIGURED & ARMED              ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo "  Still needed (manual steps):"
echo "  ┌─────────────────────────────────────────────────────┐"
echo "  │ 1. config.json → claude.api_key                     │"
echo "  │ 2. config.json → telegram.bot_token + chat_id       │"
echo "  │ 3. config.json → github.repo_url                    │"
echo "  │ 4. config.json → fastcomet.host/user/paths for each │"
echo "  │ 5. SSH keys generated + uploaded to FastComet        │"
echo "  └─────────────────────────────────────────────────────┘"
echo ""
echo "  Test the AI scout agent (requires Anthropic API key):"
echo "  $PYTHON $ROOT/_common/scout.py pet"
echo ""
echo "  Open your stores in a browser:"
echo "  http://localhost/pet       (AussiePaw Co.)"
echo "  http://localhost/auto      (RiggedUp Auto)"
echo ""
