#!/bin/bash
set -e
ROOT="/home/dsights/claude/DROPSHIPPING"

echo "=== Rebuilding Python venv ==="
rm -rf "$ROOT/venv"
python3 -m venv "$ROOT/venv" --upgrade-deps
echo "venv created"

echo "=== Installing dependencies ==="
"$ROOT/venv/bin/pip" install --upgrade pip -q
"$ROOT/venv/bin/pip" install "anthropic>=0.40.0" "httpx>=0.27.0" -q
echo "Core deps installed"

"$ROOT/venv/bin/pip" install "browser-use>=0.1.0" "playwright>=1.40.0" -q
echo "Browser deps installed"

echo "=== Installing Playwright Chromium ==="
"$ROOT/venv/bin/playwright" install chromium --with-deps 2>&1 | tail -5

echo "=== Verifying ==="
"$ROOT/venv/bin/python3" -c "import anthropic, httpx, browser_use, playwright; print('All deps OK')"

echo "=== Done ==="
