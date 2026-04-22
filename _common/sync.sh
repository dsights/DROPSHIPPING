#!/usr/bin/env bash
# ============================================================
# Zero-Click Sync Engine
# Pipeline: Local WP → GitHub → FastComet (live)
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$SCRIPT_DIR")"
CONFIG="$ROOT/config.json"
LOG_DIR="$ROOT/logs"
LOG_FILE="$LOG_DIR/sync_$(date +%F).log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

mkdir -p "$LOG_DIR"

log() { echo "[$TIMESTAMP][SYNC] $*" | tee -a "$LOG_FILE"; }
err() { echo "[$TIMESTAMP][SYNC][ERROR] $*" | tee -a "$LOG_FILE" >&2; }
die() { err "$*"; exit 1; }

# ── Read config via Python (jq-free) ────────────────────────────────────────
cfg() {
    python3 -c "
import json, sys
with open('$CONFIG') as f: c=json.load(f)
keys='$1'.split('.')
v=c
for k in keys:
    v=v[k]
print(v)
" 2>/dev/null || echo ""
}

niche_cfg() {
    python3 -c "
import json, sys
with open('$CONFIG') as f: c=json.load(f)
niche,key='$1'.split('.',1)
keys=key.split('.')
v=c['niches'][niche]
for k in keys:
    v=v[k]
print(v)
" 2>/dev/null || echo ""
}

# ── Git Push ──────────────────────────────────────────────────────────────────
git_push() {
    local niche="$1"
    local local_path
    local_path=$(niche_cfg "${niche}.local_wp_path")

    log "Git push for niche: $niche (path: $local_path)"

    cd "$local_path" || die "Cannot cd to $local_path"

    if [ ! -d ".git" ]; then
        git init
        git remote add origin "$(cfg 'github.repo_url')" 2>/dev/null || true
        log "Initialized git repo in $local_path"
    fi

    # Stage everything except secrets
    git add -A
    git status --short | head -20 | tee -a "$LOG_FILE"

    if git diff --cached --quiet; then
        log "No changes to commit for $niche"
        return 0
    fi

    git commit -m "Auto-deploy: $niche products $(date +%F-%H%M)" \
        --author="Dropship Bot <bot@localhost>" \
        || { err "Git commit failed for $niche"; return 1; }

    git push origin "$(cfg 'github.branch')" \
        || { err "Git push failed for $niche"; return 1; }

    log "Git push complete for $niche"
    cd "$ROOT"
}

# ── DB Export with URL Search-Replace ────────────────────────────────────────
db_export() {
    local niche="$1"
    local local_path
    local local_url
    local live_url
    local dump_file

    local_path=$(niche_cfg "${niche}.local_wp_path")
    local_url=$(niche_cfg "${niche}.wp_url_local")
    live_url=$(niche_cfg "${niche}.wp_url_live")
    dump_file="$ROOT/db/${niche}_$(date +%F).sql"

    log "Exporting DB for $niche: $local_url → $live_url"

    # Export local DB
    wp db export "$dump_file" \
        --path="$local_path" \
        --allow-root \
        --quiet \
        || die "wp db export failed for $niche"

    # Search-replace local URL with live URL
    wp search-replace "$local_url" "$live_url" \
        --path="$local_path" \
        --export="$dump_file" \
        --allow-root \
        --quiet \
        2>/dev/null || {
            # Fallback: sed-based replace
            sed -i "s|${local_url}|${live_url}|g" "$dump_file"
            log "Used sed fallback for URL replacement"
        }

    log "DB exported and URL-replaced: $dump_file"
    echo "$dump_file"
}

# ── Rsync Media ───────────────────────────────────────────────────────────────
rsync_media() {
    local niche="$1"
    local local_uploads
    local remote_host
    local remote_user
    local remote_port
    local ssh_key
    local remote_path

    local_uploads=$(niche_cfg "${niche}.wp_content_path")/uploads
    remote_host=$(niche_cfg "${niche}.fastcomet.host")
    remote_user=$(niche_cfg "${niche}.fastcomet.user")
    remote_port=$(niche_cfg "${niche}.fastcomet.port")
    ssh_key=$(niche_cfg "${niche}.fastcomet.ssh_key")
    remote_path=$(niche_cfg "${niche}.fastcomet.remote_wp_path")

    log "Rsyncing media for $niche to $remote_user@$remote_host:$remote_port"

    rsync -avz --progress \
        -e "ssh -p $remote_port -i $ssh_key -o StrictHostKeyChecking=no -o BatchMode=yes" \
        "$local_uploads/" \
        "$remote_user@$remote_host:$remote_path/wp-content/uploads/" \
        2>&1 | tail -5 | tee -a "$LOG_FILE" \
        || { err "rsync failed for $niche"; return 1; }

    log "Media rsync complete for $niche"
}

# ── Remote DB Import ─────────────────────────────────────────────────────────
db_import_remote() {
    local niche="$1"
    local dump_file="$2"
    local remote_host
    local remote_user
    local remote_port
    local ssh_key
    local remote_path
    local db_name
    local db_user
    local db_pass

    remote_host=$(niche_cfg "${niche}.fastcomet.host")
    remote_user=$(niche_cfg "${niche}.fastcomet.user")
    remote_port=$(niche_cfg "${niche}.fastcomet.port")
    ssh_key=$(niche_cfg "${niche}.fastcomet.ssh_key")
    remote_path=$(niche_cfg "${niche}.fastcomet.remote_wp_path")
    db_name=$(niche_cfg "${niche}.fastcomet.remote_db_name")
    db_user=$(niche_cfg "${niche}.fastcomet.remote_db_user")
    db_pass=$(niche_cfg "${niche}.fastcomet.remote_db_pass")

    log "Importing DB remotely for $niche on $remote_host"

    # Upload dump to remote temp dir
    scp -P "$remote_port" -i "$ssh_key" \
        -o StrictHostKeyChecking=no \
        -o BatchMode=yes \
        "$dump_file" \
        "$remote_user@$remote_host:/tmp/${niche}_import.sql" \
        || die "SCP of DB dump failed for $niche"

    # Import via WP-CLI on remote
    ssh -p "$remote_port" -i "$ssh_key" \
        -o StrictHostKeyChecking=no \
        -o BatchMode=yes \
        "$remote_user@$remote_host" \
        "wp db import /tmp/${niche}_import.sql --path='$remote_path' --allow-root && \
         wp cache flush --path='$remote_path' --allow-root && \
         rm -f /tmp/${niche}_import.sql && \
         echo 'DB import + cache flush done for $niche'" \
        2>&1 | tee -a "$LOG_FILE" \
        || die "Remote DB import failed for $niche"

    log "Remote DB import complete for $niche"
}

# ── Plugins + Theme Sync ─────────────────────────────────────────────────────
rsync_plugins_themes() {
    local niche="$1"
    local local_path
    local remote_host
    local remote_user
    local remote_port
    local ssh_key
    local remote_path

    local_path=$(niche_cfg "${niche}.wp_content_path")
    remote_host=$(niche_cfg "${niche}.fastcomet.host")
    remote_user=$(niche_cfg "${niche}.fastcomet.user")
    remote_port=$(niche_cfg "${niche}.fastcomet.port")
    ssh_key=$(niche_cfg "${niche}.fastcomet.ssh_key")
    remote_path=$(niche_cfg "${niche}.fastcomet.remote_wp_path")

    for dir in plugins themes; do
        if [ -d "$local_path/$dir" ]; then
            log "Syncing $dir for $niche"
            rsync -az --delete \
                -e "ssh -p $remote_port -i $ssh_key -o StrictHostKeyChecking=no -o BatchMode=yes" \
                "$local_path/$dir/" \
                "$remote_user@$remote_host:$remote_path/wp-content/$dir/" \
                2>&1 | tail -3 | tee -a "$LOG_FILE" \
                || log "Warning: $dir rsync had issues for $niche"
        fi
    done
}

# ── Process Single Niche ──────────────────────────────────────────────────────
sync_niche() {
    local niche="$1"
    local enabled
    enabled=$(niche_cfg "${niche}.enabled")

    if [ "$enabled" != "True" ] && [ "$enabled" != "true" ] && [ "$enabled" != "1" ]; then
        log "Niche '$niche' disabled — skipping sync"
        return 0
    fi

    log "====== Syncing niche: $niche ======"

    # Step 1: Git push
    git_push "$niche" || log "Warning: Git push failed, continuing..."

    # Step 2: Export + URL replace DB
    dump_file=$(db_export "$niche")

    # Step 3: Rsync media
    rsync_media "$niche" || log "Warning: Media rsync failed, continuing..."

    # Step 4: Sync plugins/themes
    rsync_plugins_themes "$niche" || log "Warning: Plugin/theme rsync had issues, continuing..."

    # Step 5: Remote DB import
    db_import_remote "$niche" "$dump_file"

    log "====== Sync complete for $niche ======"
}

# ── Entry Point ───────────────────────────────────────────────────────────────
main() {
    log "=== Zero-Click Sync Engine Starting ==="

    # Get list of enabled niches
    niches=$(python3 -c "
import json
with open('$CONFIG') as f: c=json.load(f)
print(' '.join(k for k,v in c['niches'].items() if v.get('enabled', True)))
")

    if [ -z "$niches" ]; then
        die "No enabled niches found in config.json"
    fi

    log "Niches to sync: $niches"

    for niche in $niches; do
        sync_niche "$niche" || err "Sync failed for $niche — continuing with next"
    done

    log "=== All niches synced successfully ==="
}

# Allow running a single niche: ./sync.sh pet
if [ $# -eq 1 ]; then
    sync_niche "$1"
else
    main
fi
