#!/usr/bin/env bash
# ============================================================
# Master Sequence Orchestrator
# Runs all phases for all niches sequentially.
# Triggered by crontab at 04:00 AEST daily.
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$SCRIPT_DIR"
export PLAYWRIGHT_BROWSERS_PATH=/home/dsights/.playwright
CONFIG="$ROOT/config.json"
LOG_DIR="$ROOT/logs"
LOG_FILE="$LOG_DIR/master_$(date +%F).log"
PYTHON="$ROOT/venv/bin/python3"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

mkdir -p "$LOG_DIR" "$ROOT/db" "$ROOT/reports"

log()  { echo "[$TIMESTAMP][MASTER] $*" | tee -a "$LOG_FILE"; }
err()  { echo "[$TIMESTAMP][MASTER][ERROR] $*" | tee -a "$LOG_FILE" >&2; }
die()  { err "$*"; exit 1; }
hdr()  { log ""; log "══════════════════════════════════"; log "$*"; log "══════════════════════════════════"; }

# ── Sanity checks ─────────────────────────────────────────────────────────────
[ -f "$PYTHON" ]  || die "Python venv not found at $ROOT/venv. Run: python3 -m venv venv && venv/bin/pip install -r requirements.txt"
[ -f "$CONFIG" ]  || die "config.json not found at $ROOT"

# ── Get enabled niches ────────────────────────────────────────────────────────
NICHES=$("$PYTHON" -c "
import json
with open('$CONFIG') as f: c=json.load(f)
print(' '.join(k for k,v in c['niches'].items() if v.get('enabled', True)))
")

[ -n "$NICHES" ] || die "No enabled niches in config.json"
log "Niches to process: $NICHES"

# ── Phase 1: Scout & Merchant ─────────────────────────────────────────────────
hdr "PHASE 1 — Scout & Merchant (Product Sourcing)"
for niche in $NICHES; do
    log "Running scout for: $niche"
    "$PYTHON" "$ROOT/_common/scout.py" "$niche" 2>&1 | tee -a "$LOG_FILE" \
        && log "Scout done: $niche" \
        || err "Scout failed for $niche — continuing"
    sleep 5  # Rate-limit buffer between niches
done

# ── Phase 2: Marketing & Hype ─────────────────────────────────────────────────
hdr "PHASE 2 — Marketing & Hype (Social Media)"
for niche in $NICHES; do
    log "Running hype for: $niche"
    "$PYTHON" "$ROOT/_common/hype.py" "$niche" 2>&1 | tee -a "$LOG_FILE" \
        && log "Hype done: $niche" \
        || err "Hype failed for $niche — continuing"
    sleep 3
done

# ── Phase 3: Zero-Click Sync ──────────────────────────────────────────────────
hdr "PHASE 3 — Zero-Click Sync (Local → GitHub → FastComet)"
bash "$ROOT/_common/sync.sh" 2>&1 | tee -a "$LOG_FILE" \
    && log "Sync complete" \
    || err "Sync had errors — check $LOG_FILE"

# ── Phase 4: CEO Report (runs at 08:45 via separate cron) ────────────────────
# Report cron fires at 08:45 AEST — this phase is skipped in master run
# to allow WooCommerce sales data to accumulate overnight.
hdr "PHASE 4 — CEO Report (scheduled for 08:45 AEST)"
log "Report will be sent at 08:45 AEST by its own cron job."

hdr "MASTER SEQUENCE COMPLETE — $(date +%F\ %T)"
log "Full log: $LOG_FILE"
