#!/usr/bin/env bash
# ============================================================
# Sync Engine — Local WP → niches/ → GitHub → FastComet
#
# How it works:
#   1. Copies wp-content (themes, plugins, mu-plugins) from
#      /var/www/html/{niche}/ into niches/{niche}/
#   2. Exports DB with URL search-replace (local → live)
#   3. git add + commit + push to main
#   4. GitHub Actions FTP deploy fires automatically
#
# No SSH keys or FastComet credentials needed here.
# FastComet deployment is handled entirely by GitHub Actions.
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$SCRIPT_DIR")"
CONFIG="$ROOT/config.json"
LOG_DIR="$ROOT/logs"
LOG_FILE="$LOG_DIR/sync_$(date +%F).log"
PYTHON="$ROOT/venv/bin/python3"

mkdir -p "$LOG_DIR"
log()  { echo "[$(date +%T)][SYNC] $*" | tee -a "$LOG_FILE"; }
err()  { echo "[$(date +%T)][SYNC][ERROR] $*" | tee -a "$LOG_FILE" >&2; }
die()  { err "$*"; exit 1; }

cfg() {
    "$PYTHON" -c "
import json
with open('$CONFIG') as f: c=json.load(f)
keys='$1'.split('.')
v=c
for k in keys: v=v[k]
print(v)
" 2>/dev/null || echo ""
}

niche_cfg() {
    "$PYTHON" -c "
import json
with open('$CONFIG') as f: c=json.load(f)
niche,key='$1'.split('.',1)
keys=key.split('.')
v=c['niches'][niche]
for k in keys: v=v[k]
print(v)
" 2>/dev/null || echo ""
}

# ── Step 1: Copy wp-content into niches/ ─────────────────────────────────────
copy_wp_content() {
    local niche="$1"
    local src
    local dst

    src=$(niche_cfg "${niche}.wp_content_path")    # /var/www/html/pet/wp-content
    dst="$ROOT/niches/${niche}/wp-content"

    [ -d "$src" ] || die "wp-content not found at $src"
    mkdir -p "$dst"

    log "Copying wp-content for $niche: $src → $dst"

    rsync -a --delete \
        --exclude="cache/" \
        --exclude="upgrade/" \
        --exclude="ai-content/" \
        --exclude="uploads/" \
        --exclude="ai1wm-backups/" \
        --exclude="*.log" \
        --exclude="wp-cache-config.php" \
        --exclude="advanced-cache.php" \
        --exclude="advanced-headers.php" \
        "$src/" "$dst/" \
        2>&1 | tee -a "$LOG_FILE" \
        || die "rsync of wp-content failed for $niche"

    log "wp-content copy done for $niche"
}

# ── Step 2: Export DB with URL search-replace ──────────────────────────────────
export_db() {
    local niche="$1"
    local local_path local_url live_url dump_file

    local_path=$(niche_cfg "${niche}.local_wp_path")
    local_url=$(niche_cfg "${niche}.wp_url_local")
    live_url=$(niche_cfg "${niche}.wp_url_live")
    dump_file="$ROOT/niches/${niche}/${niche}-store.sql"

    log "Exporting DB for $niche (${local_url} → ${live_url})"

    wp db export "$dump_file" \
        --path="$local_path" \
        --allow-root \
        --quiet \
        || { err "wp db export failed for $niche"; return 1; }

    # URL search-replace in the dump
    if wp search-replace "$local_url" "$live_url" \
            --path="$local_path" \
            --export="$dump_file" \
            --allow-root \
            --quiet 2>/dev/null; then
        log "URL search-replace done (wp-cli)"
    else
        sed -i "s|${local_url}|${live_url}|g" "$dump_file"
        log "URL search-replace done (sed fallback)"
    fi

    log "DB exported: $dump_file"
}

# ── Step 3: Git add + commit + push ──────────────────────────────────────────
git_push() {
    local branch
    branch=$(cfg "github.branch")
    branch="${branch:-main}"

    log "Staging changes for git..."
    cd "$ROOT"

    # Stage niches/ directory (themes, plugins, mu-plugins, SQL)
    git add niches/

    # Stage any _common script changes, CRONTAB, STATUS updates
    git add _common/ CRONTAB.md STATUS.md 2>/dev/null || true

    if git diff --cached --quiet; then
        log "Nothing new to commit — skipping push"
        return 0
    fi

    local msg="Auto-deploy: wp-content + db export $(date +%F-%H%M)"
    git commit -m "$msg" --author="CEO Bot <ceo@dropship.local>" \
        || die "git commit failed"

    git push origin "$branch" \
        || die "git push failed — check SSH key or GitHub remote"

    log "Pushed to GitHub ($branch) — GitHub Actions will FTP deploy to FastComet"
}

# ── Sync one niche ────────────────────────────────────────────────────────────
sync_niche() {
    local niche="$1"
    local enabled
    enabled=$(niche_cfg "${niche}.enabled")

    if [ "$enabled" != "True" ] && [ "$enabled" != "true" ] && [ "$enabled" != "1" ]; then
        log "Niche '$niche' disabled — skipping"
        return 0
    fi

    log "====== Syncing: $niche ======"
    copy_wp_content "$niche" || { err "wp-content copy failed for $niche"; return 1; }
    export_db "$niche" || err "DB export failed for $niche — continuing"
    log "====== $niche ready for git push ======"
}

# ── Main ──────────────────────────────────────────────────────────────────────
main() {
    log "=== Sync Engine Starting ==="

    local niches
    niches=$("$PYTHON" -c "
import json
with open('$CONFIG') as f: c=json.load(f)
print(' '.join(k for k,v in c['niches'].items() if v.get('enabled', True)))
")

    [ -n "$niches" ] || die "No enabled niches in config.json"
    log "Niches: $niches"

    for niche in $niches; do
        sync_niche "$niche" || err "Sync failed for $niche — continuing"
    done

    # Single git push after all niches are staged
    git_push

    log "=== Sync complete — GitHub Actions will deploy to FastComet ==="
}

if [ $# -eq 1 ]; then
    sync_niche "$1"
    git_push
else
    main
fi
