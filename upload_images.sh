#!/usr/bin/env bash
# =============================================================================
# upload_images.sh — SCP product images from local to FastComet live server
#
# Why: GitHub Actions excludes uploads/ from FTP deploy (too large/slow).
#      Run this once after initial deploy, then when new products are added.
#
# Usage:
#   bash upload_images.sh
#   bash upload_images.sh --pet-only
#   bash upload_images.sh --auto-only
#   bash upload_images.sh --dry-run
# =============================================================================
[ -n "${BASH_VERSION:-}" ] || exec bash "$0" "$@"
set -euo pipefail

SSH_HOST="${SSH_HOST:-}"          # or set via env: SSH_HOST=server123.fastcomet.net
SSH_USER="${SSH_USER:-tripxen1}"
SSH_PORT="${SSH_PORT:-22}"
SSH_KEY="${SSH_KEY_PATH:-/home/dsights/.ssh/fastcomet_deploy}"

PET_LOCAL="/var/www/html/pet/wp-content/uploads/"
AUTO_LOCAL="/var/www/html/auto/wp-content/uploads/"

PET_REMOTE="/home/tripxen1/dropshipping/public_html/pet-store/wp-content/uploads/"
AUTO_REMOTE="/home/tripxen1/dropshipping/public_html/auto-store/wp-content/uploads/"

# ── Flags ────────────────────────────────────────────────────────────────────
PET_ONLY=false
AUTO_ONLY=false
DRY_RUN=false

for arg in "$@"; do
    case "$arg" in
        --pet-only)   PET_ONLY=true ;;
        --auto-only)  AUTO_ONLY=true ;;
        --dry-run)    DRY_RUN=true ;;
        *) echo "Unknown flag: $arg"; exit 1 ;;
    esac
done

# ── Resolve SSH host ──────────────────────────────────────────────────────────
if [ -z "$SSH_HOST" ]; then
    # Try to read from config.json
    CONFIG="$(dirname "$0")/config.json"
    if [ -f "$CONFIG" ]; then
        SSH_HOST=$(python3 -c "import json; c=json.load(open('$CONFIG')); print(c.get('fastcomet',{}).get('ssh_host',''))" 2>/dev/null || echo "")
    fi
fi

if [ -z "$SSH_HOST" ]; then
    echo "ERROR: SSH_HOST not set."
    echo "  Option 1: export SSH_HOST=server123.fastcomet.net"
    echo "  Option 2: add fastcomet.ssh_host to config.json"
    exit 1
fi

if [ ! -f "$SSH_KEY" ]; then
    echo "ERROR: SSH key not found at $SSH_KEY"
    echo "  Try: export SSH_KEY_PATH=/path/to/your/fastcomet_deploy"
    exit 1
fi

SCP_OPTS="-i $SSH_KEY -P $SSH_PORT -o StrictHostKeyChecking=no -o ConnectTimeout=30 -r"
[ "$DRY_RUN" = true ] && SCP_OPTS="$SCP_OPTS -n" || true

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║         Upload Product Images → FastComet           ║"
echo "╚══════════════════════════════════════════════════════╝"
echo "  Host    : $SSH_HOST"
echo "  User    : $SSH_USER"
echo "  Port    : $SSH_PORT"
echo "  Dry run : $DRY_RUN"
echo ""

upload_store() {
    local name="$1"
    local src="$2"
    local remote_dest="$3"

    if [ ! -d "$src" ]; then
        echo "WARNING: Local uploads dir not found: $src — skipping $name"
        return
    fi

    local size
    size=$(du -sh "$src" 2>/dev/null | cut -f1 || echo "?")
    echo "=== $name: uploading $size from $src ==="

    if [ "$DRY_RUN" = true ]; then
        echo "  [DRY RUN] scp $SCP_OPTS $src ${SSH_USER}@${SSH_HOST}:${remote_dest}"
        return
    fi

    # Use rsync over SSH if available (resumable, skips unchanged files)
    if command -v rsync &>/dev/null; then
        rsync -avz --progress \
            -e "ssh -i $SSH_KEY -p $SSH_PORT -o StrictHostKeyChecking=no" \
            "$src" \
            "${SSH_USER}@${SSH_HOST}:${remote_dest%/}/../" \
            && echo "  rsync OK"
    else
        scp $SCP_OPTS "$src" "${SSH_USER}@${SSH_HOST}:${remote_dest}" \
            && echo "  scp OK"
    fi
}

if [ "$AUTO_ONLY" = false ]; then
    upload_store "Furlio (pet)" "$PET_LOCAL" "$PET_REMOTE"
fi

if [ "$PET_ONLY" = false ]; then
    upload_store "LetsDrive (auto)" "$AUTO_LOCAL" "$AUTO_REMOTE"
fi

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  Images uploaded. Verify at:                        ║"
echo "║    https://furlio.au/shop                           ║"
echo "║    https://letsdrive.au/shop                        ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""
