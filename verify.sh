#!/usr/bin/env bash
# Health check — run anytime to verify the full stack is operational.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON="$ROOT/venv/bin/python3"
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()   { echo -e "${GREEN}  ✓ $*${NC}"; }
warn() { echo -e "${YELLOW}  ⚠ $*${NC}"; }
fail() { echo -e "${RED}  ✗ $*${NC}"; FAIL=1; }
FAIL=0

echo -e "${GREEN}=== Dropshipping Empire — Health Check ===${NC}"
echo "$(date)"
echo ""

# ── System services ───────────────────────────────────────────────────────────
echo "[ System Services ]"
service apache2 status &>/dev/null && ok "Apache2 running" || fail "Apache2 not running — sudo service apache2 start"
service mariadb status &>/dev/null && ok "MariaDB running" || fail "MariaDB not running — sudo service mariadb start"

# ── CLI tools ─────────────────────────────────────────────────────────────────
echo ""
echo "[ CLI Tools ]"
command -v php   &>/dev/null && ok "PHP: $(php --version | head -1 | cut -d' ' -f1-2)" || fail "PHP missing"
command -v wp    &>/dev/null && ok "WP-CLI: $(wp --version --allow-root 2>/dev/null)" || fail "WP-CLI missing"
command -v mysql &>/dev/null || command -v mariadb &>/dev/null && ok "MySQL/MariaDB client" || fail "MySQL client missing"
command -v rsync &>/dev/null && ok "rsync" || fail "rsync missing"
command -v git   &>/dev/null && ok "git: $(git --version)" || fail "git missing"
[ -f "$PYTHON" ] && ok "Python venv: $($PYTHON --version)" || fail "Python venv missing — run setup.sh"

# ── Python packages ───────────────────────────────────────────────────────────
echo ""
echo "[ Python Packages ]"
if [ -f "$PYTHON" ]; then
    for pkg in anthropic browser_use playwright httpx; do
        "$PYTHON" -c "import $pkg; print($pkg.__version__ if hasattr($pkg,'__version__') else 'ok')" 2>/dev/null \
            && ok "$pkg" || fail "$pkg not installed — run setup.sh"
    done
fi

# ── WordPress installations ───────────────────────────────────────────────────
echo ""
echo "[ WordPress Installs ]"
for niche in pet auto; do
    wp_path="/var/www/html/$niche"
    if [ -f "$wp_path/wp-config.php" ]; then
        WP_VER=$(wp core version --path="$wp_path" --allow-root 2>/dev/null || echo "error")
        WC_ACTIVE=$(wp plugin is-active woocommerce --path="$wp_path" --allow-root 2>/dev/null && echo "active" || echo "inactive")
        YOAST_ACTIVE=$(wp plugin is-active wordpress-seo --path="$wp_path" --allow-root 2>/dev/null && echo "active" || echo "inactive")
        ok "$niche: WordPress $WP_VER | WooCommerce $WC_ACTIVE | Yoast $YOAST_ACTIVE"
    else
        fail "$niche: WordPress not found at $wp_path"
    fi
done

# ── HTTP reachability ─────────────────────────────────────────────────────────
echo ""
echo "[ HTTP Endpoints ]"
for niche in pet auto; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost/$niche/" --max-time 5 2>/dev/null || echo "000")
    if [[ "$HTTP_CODE" == "200" || "$HTTP_CODE" == "301" || "$HTTP_CODE" == "302" ]]; then
        ok "http://localhost/$niche/ → HTTP $HTTP_CODE"
    else
        fail "http://localhost/$niche/ → HTTP $HTTP_CODE (Apache may not be serving it)"
    fi
done

# ── config.json secrets ───────────────────────────────────────────────────────
echo ""
echo "[ Config.json Secrets ]"
"$PYTHON" - <<'PYEOF'
import json, sys
with open("/home/dsights/claude/DROPSHIPPING/config.json") as f:
    cfg = json.load(f)

checks = {
    "claude.api_key":             cfg["claude"]["api_key"],
    "telegram.bot_token":         cfg["telegram"]["bot_token"],
    "telegram.chat_id":           cfg["telegram"]["chat_id"],
    "github.repo_url":            cfg["github"]["repo_url"],
    "pet.woocommerce_consumer_key":  cfg["niches"]["pet"]["woocommerce_consumer_key"],
    "auto.woocommerce_consumer_key": cfg["niches"]["auto"]["woocommerce_consumer_key"],
    "pet.fastcomet.host":         cfg["niches"]["pet"]["fastcomet"]["host"],
    "auto.fastcomet.host":        cfg["niches"]["auto"]["fastcomet"]["host"],
}

all_ok = True
for key, val in checks.items():
    if "YOUR_" in str(val) or not val:
        print(f"  \033[33m  ⚠ {key}: NOT SET\033[0m")
        all_ok = False
    else:
        masked = str(val)[:8] + "..." if len(str(val)) > 8 else str(val)
        print(f"  \033[32m  ✓ {key}: {masked}\033[0m")

if not all_ok:
    print("\n  Edit config.json to fill in missing values.")
PYEOF

# ── SSH keys ──────────────────────────────────────────────────────────────────
echo ""
echo "[ SSH Keys ]"
for keyfile in ~/.ssh/fastcomet_pet_rsa ~/.ssh/fastcomet_auto_rsa; do
    [ -f "$keyfile" ] && ok "$keyfile" || warn "$keyfile missing — generate with ssh-keygen"
done

# ── Crontab ───────────────────────────────────────────────────────────────────
echo ""
echo "[ Crontab ]"
if crontab -l 2>/dev/null | grep -q "master.sh"; then
    ok "Master cron installed (04:00 AEST daily)"
else
    warn "Crontab not installed — run post_install.sh"
fi
if crontab -l 2>/dev/null | grep -q "report.py"; then
    ok "Report cron installed (08:45 AEST daily)"
else
    warn "Report cron not installed — run post_install.sh"
fi

# ── Database ──────────────────────────────────────────────────────────────────
echo ""
echo "[ SQLite Agent DB ]"
DB_PATH="/home/dsights/claude/DROPSHIPPING/db/products.db"
if [ -f "$DB_PATH" ]; then
    PRODUCT_COUNT=$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM products;" 2>/dev/null || echo "0")
    ok "products.db exists — $PRODUCT_COUNT products recorded"
else
    warn "products.db not yet created (will be created on first scout run)"
fi

# ── Result ────────────────────────────────────────────────────────────────────
echo ""
echo "══════════════════════════════════"
if [ "$FAIL" -eq 0 ]; then
    echo -e "${GREEN}  ALL CHECKS PASSED — Empire is operational${NC}"
else
    echo -e "${RED}  SOME CHECKS FAILED — See above for fixes${NC}"
fi
echo "══════════════════════════════════"
echo ""
