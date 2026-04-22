#!/usr/bin/env bash
# One-time Python venv setup + dependency install.
# Run AFTER install_stack.sh completes.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()  { echo -e "${GREEN}  ✓ $*${NC}"; }
inf() { echo -e "${YELLOW}  → $*${NC}"; }
err() { echo -e "${RED}  ✗ $*${NC}"; }

echo -e "${GREEN}=== Python Agent Environment Setup ===${NC}"
echo "Root: $ROOT"

# ── Install python3-venv if missing (needs sudo once) ────────────────────────
if ! python3 -c "import venv" 2>/dev/null; then
    inf "Installing python3-venv..."
    sudo apt-get install -y python3-venv python3-pip 2>&1 | tail -3
fi

# ── Install python3-pip if pip3 missing ──────────────────────────────────────
if ! command -v pip3 &>/dev/null && ! python3 -m pip --version &>/dev/null 2>&1; then
    inf "Installing pip..."
    sudo apt-get install -y python3-pip 2>&1 | tail -3
fi

# ── Create venv ───────────────────────────────────────────────────────────────
inf "Creating Python venv at $ROOT/venv..."
python3 -m venv "$ROOT/venv"
ok "venv created ($(${ROOT}/venv/bin/python --version))"

# ── Upgrade pip inside venv ───────────────────────────────────────────────────
inf "Upgrading pip..."
"$ROOT/venv/bin/pip" install --upgrade pip -q
ok "pip upgraded"

# ── Install Python dependencies ───────────────────────────────────────────────
inf "Installing Python dependencies..."
"$ROOT/venv/bin/pip" install \
    "anthropic>=0.40.0" \
    "browser-use>=0.1.0" \
    "playwright>=1.40.0" \
    "httpx>=0.27.0" \
    -q
ok "Python deps installed"

# ── Install Playwright browser (Chromium) ─────────────────────────────────────
inf "Installing Playwright Chromium browser..."
"$ROOT/venv/bin/playwright" install chromium --with-deps 2>&1 | tail -5
ok "Playwright Chromium ready"

# ── Runtime directories ───────────────────────────────────────────────────────
inf "Creating runtime directories..."
mkdir -p "$ROOT"/{logs,db,reports}
ok "Directories ready"

# ── Script permissions ─────────────────────────────────────────────────────────
inf "Setting script permissions..."
chmod +x "$ROOT/master.sh"
chmod +x "$ROOT/_common/sync.sh"
chmod +x "$ROOT/install_stack.sh"
chmod +x "$ROOT/post_install.sh" 2>/dev/null || true
ok "Permissions set"

# ── Dependency check ───────────────────────────────────────────────────────────
echo ""
echo "Checking system dependencies..."
for cmd in wp rsync ssh git mariadb apache2; do
    if command -v "$cmd" &>/dev/null || service "$cmd" status &>/dev/null 2>&1; then
        ok "$cmd found"
    else
        err "$cmd NOT FOUND — run install_stack.sh first if you haven't"
    fi
done

echo ""
echo -e "${GREEN}=== Setup complete ===${NC}"
echo ""
echo "NEXT STEPS:"
echo "  1. Run the post-install configurator:"
echo "     bash $ROOT/post_install.sh"
echo ""
echo "  2. Fill in remaining config.json secrets:"
echo "     - claude.api_key"
echo "     - telegram.bot_token + chat_id"
echo "     - github.repo_url"
echo "     - fastcomet SSH credentials"
echo ""
echo "  3. Install crontab (see CRONTAB.md):"
echo "     crontab -e"
echo ""
echo "  4. Test the scout agent:"
echo "     $ROOT/venv/bin/python3 $ROOT/_common/scout.py pet"
echo ""
