#!/usr/bin/env bash
# ==============================================================
# AI CEO — Autonomous Dropshipping Empire Manager
# Run this daily (or let cron handle it at 04:00 AEST).
#
# Usage:
#   ./ceo.sh                   Full daily CEO run (all niches)
#   ./ceo.sh --dry-run         Plan + competitor analysis, no scout/hype execution
#   ./ceo.sh --niche pet       Focus on Furlio only
#   ./ceo.sh --niche auto      Focus on LetsDrive only
#   ./ceo.sh --brief-only      Send today's briefing without running tasks
# ==============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON="$SCRIPT_DIR/venv/bin/python3"
LOG_DIR="$SCRIPT_DIR/logs"
TODAY=$(date +%F)

export PLAYWRIGHT_BROWSERS_PATH=/home/dsights/.playwright

# Services check
if ! curl -sf http://localhost/pet/ > /dev/null 2>&1; then
    echo "[CEO] WARNING: Apache may be down. Run: sudo service apache2 start && sudo service mariadb start"
fi

mkdir -p "$LOG_DIR" "$SCRIPT_DIR/reports" "$SCRIPT_DIR/db"

[ -f "$PYTHON" ] || { echo "ERROR: venv not found. Run: python3 -m venv venv && venv/bin/pip install -r requirements.txt"; exit 1; }
[ -f "$SCRIPT_DIR/config.json" ] || { echo "ERROR: config.json not found at $SCRIPT_DIR"; exit 1; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║         AI CEO — DROPSHIPPING EMPIRE                ║"
echo "║  Furlio (pet) + LetsDrive (auto) → \$1M AUD target   ║"
echo "╚══════════════════════════════════════════════════════╝"
echo "  Date  : $TODAY"
echo "  Args  : ${*:-none}"
echo ""

"$PYTHON" "$SCRIPT_DIR/_common/ceo.py" "$@" 2>&1 | tee -a "$LOG_DIR/ceo_${TODAY}.log"

echo ""
echo "[CEO] Done. Check:"
echo "  Briefing : $SCRIPT_DIR/reports/ceo_briefing_${TODAY}.txt"
echo "  Full log : $LOG_DIR/ceo_${TODAY}.log"
