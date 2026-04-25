#!/usr/bin/env bash
# =============================================================================
# deploy.sh — Commit all changes and push to GitHub → triggers FastComet deploy
#
# Usage:
#   bash deploy.sh              # Sync wp-content + git commit + push
#   bash deploy.sh --with-db    # Also export fresh DB dumps (URL-replaced)
#   bash deploy.sh --push-only  # Skip wp-content sync, just commit + push
#   bash deploy.sh --dry-run    # Show what would be committed, don't push
# =============================================================================
[ -n "${BASH_VERSION:-}" ] || exec bash "$0" "$@"
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON="$SCRIPT_DIR/venv/bin/python3"
CONFIG="$SCRIPT_DIR/config.json"
LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/deploy_$(date +%F).log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

mkdir -p "$LOG_DIR"

# ── Flags ────────────────────────────────────────────────────────────────────
WITH_DB=false
PUSH_ONLY=false
DRY_RUN=false

for arg in "$@"; do
    case "$arg" in
        --with-db)    WITH_DB=true ;;
        --push-only)  PUSH_ONLY=true ;;
        --dry-run)    DRY_RUN=true ;;
        *) echo "Unknown flag: $arg"; exit 1 ;;
    esac
done

log()  { echo "[$TIMESTAMP][DEPLOY] $*" | tee -a "$LOG_FILE"; }
err()  { echo "[$TIMESTAMP][DEPLOY][ERROR] $*" | tee -a "$LOG_FILE" >&2; }
die()  { err "$*"; exit 1; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║            DEPLOY — Local → GitHub → FastComet      ║"
echo "╚══════════════════════════════════════════════════════╝"
echo "  Date      : $(date +%F\ %T)"
echo "  With DB   : $WITH_DB"
echo "  Push Only : $PUSH_ONLY"
echo "  Dry Run   : $DRY_RUN"
echo ""

# ── Prerequisites ─────────────────────────────────────────────────────────────
[ -f "$PYTHON" ]  || die "venv not found. Run: python3 -m venv venv && venv/bin/pip install -r requirements.txt"
[ -f "$CONFIG" ]  || die "config.json not found"

# Test GitHub SSH auth
log "Checking GitHub SSH auth..."
if ! ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    err "GitHub SSH authentication failed."
    echo ""
    echo "  Fix: Add this public key to github.com → Settings → SSH Keys:"
    echo ""
    cat ~/.ssh/github_dropshipping.pub 2>/dev/null || echo "  Key not found at ~/.ssh/github_dropshipping.pub"
    echo ""
    exit 1
fi
log "GitHub SSH auth OK"

# ── Step 1: Sync wp-content from local WP → niches/ ─────────────────────────
niche_cfg() {
    "$PYTHON" -c "
import json
with open('$CONFIG') as f: c=json.load(f)
niche,key='$1'.split('.',1)
v=c['niches'][niche]
for k in key.split('.'): v=v[k]
print(v)
" 2>/dev/null || echo ""
}

get_niches() {
    "$PYTHON" -c "
import json
with open('$CONFIG') as f: c=json.load(f)
print(' '.join(k for k,v in c['niches'].items() if v.get('enabled', True)))
"
}

if [ "$PUSH_ONLY" = false ]; then
    NICHES=$(get_niches)
    [ -n "$NICHES" ] || die "No enabled niches in config.json"

    for niche in $NICHES; do
        log "=== Syncing wp-content for: $niche ==="

        src=$(niche_cfg "${niche}.wp_content_path")   # /var/www/html/pet/wp-content
        dst="$SCRIPT_DIR/niches/${niche}/wp-content"

        [ -d "$src" ] || { err "wp-content not found at $src — is Apache running?"; continue; }
        mkdir -p "$dst"

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
            2>&1 | tee -a "$LOG_FILE"

        log "wp-content synced for $niche"

        if [ "$WITH_DB" = true ]; then
            log "Exporting DB for $niche..."
            local_path=$(niche_cfg "${niche}.local_wp_path")
            local_url=$(niche_cfg  "${niche}.wp_url_local")
            live_url=$(niche_cfg   "${niche}.wp_url_live")
            dump_file="$SCRIPT_DIR/niches/${niche}/${niche}-store.sql"

            wp db export "$dump_file" \
                --path="$local_path" \
                --allow-root \
                --quiet 2>&1 | tee -a "$LOG_FILE" \
                || { err "DB export failed for $niche"; continue; }

            # URL search-replace in the dump file
            sed -i "s|${local_url}|${live_url}|g" "$dump_file"
            log "DB exported + URL replaced: $dump_file"
        fi
    done
fi

# ── Step 2: Git stage all relevant changes ─────────────────────────────────
log "Staging changes..."
cd "$SCRIPT_DIR"

# Stage all tracked file changes
git add -u

# Stage specific untracked files we want in the repo
git add \
    niches/ \
    _common/ \
    .github/ \
    ceo.sh master.sh start.sh stop.sh deploy.sh \
    requirements.txt SOP.md STATUS.md CRONTAB.md \
    fastcomet_init.sh fix_apache_vhost.sh \
    seed_products.py setup.sh post_install.sh verify.sh \
    NEW_SHOP_ONBOARDING_SOP.md NEW_STORE_PROMPT.md MASTER_PROMPT.md \
    2>/dev/null || true

# Never stage these (even if -u would pick them up)
git restore --staged config.json 2>/dev/null || true
git restore --staged .claude/ 2>/dev/null || true

if git diff --cached --quiet; then
    log "Nothing new to commit — already up to date"
    echo ""
    echo "Nothing to deploy. Run 'bash deploy.sh --with-db' to force a DB re-export."
    exit 0
fi

echo ""
log "Files staged for commit:"
git diff --cached --name-only | tee -a "$LOG_FILE"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] Would commit and push the above files."
    git restore --staged . 2>/dev/null || true
    exit 0
fi

# ── Step 3: Commit ────────────────────────────────────────────────────────────
COMMIT_MSG="Deploy $(date +%F-%H%M)"
if [ "$WITH_DB" = true ]; then
    COMMIT_MSG="Deploy $(date +%F-%H%M) [+DB]"
fi

git commit -m "$COMMIT_MSG" --author="Deploy Bot <deploy@dropship.local>" \
    || die "git commit failed"

log "Committed: $COMMIT_MSG"

# ── Step 4: Push → triggers GitHub Actions → FastComet FTP deploy ─────────────
log "Pushing to GitHub..."
git push origin main 2>&1 | tee -a "$LOG_FILE" \
    || die "git push failed"

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  Pushed to GitHub. GitHub Actions is now deploying  ║"
echo "║  your changes to FastComet via FTP.                 ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""
echo "  Monitor: https://github.com/dsights/DROPSHIPPING/actions"
echo "  Log    : $LOG_FILE"
echo ""
log "Deploy complete — watch GitHub Actions for FTP deploy status"
