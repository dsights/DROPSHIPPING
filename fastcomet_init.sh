#!/bin/bash
# ====================================================================
# FastComet WordPress Initialization Script
# Run this ON your FastComet server via SSH after the first FTP deploy.
# It downloads WP core, creates wp-config.php, imports the SQL dump,
# and replaces localhost URLs with live URLs.
#
# Usage (from your local machine):
#   ssh -i ~/.ssh/fastcomet_deploy tripxen1@YOUR_SERVER_IP \
#     PET_DB_PASS=yourpass AUTO_DB_PASS=yourpass bash -s < fastcomet_init.sh
#
# Or fill in the passwords below and run without env vars.
# ====================================================================

# ── Configuration — fill in passwords or pass as env vars ────────────────────
PET_DIR="${PET_DIR:-/home/tripxen1/dropshipping/public_html/pet-store}"
PET_DB_NAME="${PET_DB_NAME:-tripxen1_petdb}"
PET_DB_USER="${PET_DB_USER:-tripxen1_petuser}"
PET_DB_PASS="${PET_DB_PASS:-FILL_IN_PET_DB_PASSWORD}"
PET_LIVE_URL="${PET_LIVE_URL:-https://furlio.au}"
PET_LOCAL_URL="${PET_LOCAL_URL:-http://localhost/pet}"

AUTO_DIR="${AUTO_DIR:-/home/tripxen1/dropshipping/public_html/auto-store}"
AUTO_DB_NAME="${AUTO_DB_NAME:-tripxen1_autodb}"
AUTO_DB_USER="${AUTO_DB_USER:-tripxen1_autouser}"
AUTO_DB_PASS="${AUTO_DB_PASS:-FILL_IN_AUTO_DB_PASSWORD}"
AUTO_LIVE_URL="${AUTO_LIVE_URL:-https://letsdrive.au}"
AUTO_LOCAL_URL="${AUTO_LOCAL_URL:-http://localhost/auto}"
# ─────────────────────────────────────────────────────────────────────────────

setup_store() {
    local dir=$1
    local db_name=$2
    local db_user=$3
    local db_pass=$4
    local live_url=$5
    local local_url=$6
    local sql_file="${dir}/${7}"

    echo "=================================================="
    echo " Setting up: $dir"
    echo "=================================================="

    if [ ! -d "$dir" ]; then
        echo "ERROR: Directory $dir does not exist."
        echo "Make sure the FTP deploy ran and FastComet directories are created."
        return 1
    fi

    cd "$dir" || return 1

    # Resolve wp-cli
    local wp_cmd="wp"
    if ! command -v wp &>/dev/null; then
        echo "-> WP-CLI not in PATH — downloading locally..."
        curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        wp_cmd="./wp-cli.phar"
    fi

    # Download WordPress core (skips wp-content — already FTP-deployed)
    echo "-> Downloading WordPress core files..."
    $wp_cmd core download --skip-content --force --allow-root

    # Create wp-config.php
    echo "-> Creating wp-config.php..."
    $wp_cmd config create \
        --dbname="$db_name" \
        --dbuser="$db_user" \
        --dbpass="$db_pass" \
        --dbhost="localhost" \
        --force \
        --allow-root

    # Import the database if SQL file exists
    if [ -f "$sql_file" ]; then
        echo "-> Importing database from $sql_file..."
        $wp_cmd db import "$sql_file" --allow-root

        # Replace any remaining localhost URLs with live domain
        echo "-> URL search-replace: $local_url → $live_url"
        $wp_cmd search-replace "$local_url" "$live_url" --all-tables --quiet --allow-root

        # Inject Stripe secret key (was scrubbed from SQL for git safety)
        echo ""
        echo "⚠️  IMPORTANT: Stripe secret key was removed from SQL for security."
        echo "   After init completes, go to:"
        echo "   $live_url/wp-admin → WooCommerce → Settings → Payments → Stripe"
        echo "   and paste your live Stripe secret key (sk_live_...)."
        echo ""
    else
        echo "WARNING: SQL dump not found at $sql_file"
        echo "  Upload it via: workflow_dispatch include_db=true OR scp"
    fi

    # Fix file permissions
    echo "-> Fixing permissions..."
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    chmod 640 wp-config.php

    # Flush cache
    echo "-> Flushing WordPress cache..."
    $wp_cmd cache flush --allow-root 2>/dev/null || true

    echo ""
    echo "✅ Done: $dir"
    echo ""
}

echo ""
echo "=============================================="
echo " FastComet WordPress Initialization"
echo " Furlio (pet) + LetsDrive (auto)"
echo "=============================================="
echo ""

# Validate passwords are filled in
if [ "$PET_DB_PASS" = "FILL_IN_PET_DB_PASSWORD" ] || [ "$AUTO_DB_PASS" = "FILL_IN_AUTO_DB_PASSWORD" ]; then
    echo "ERROR: DB passwords are not set."
    echo ""
    echo "Run with env vars:"
    echo "  ssh -i ~/.ssh/fastcomet_deploy tripxen1@YOUR_SERVER \\"
    echo "    PET_DB_PASS='yourpass' AUTO_DB_PASS='yourpass' bash -s < fastcomet_init.sh"
    exit 1
fi

setup_store "$PET_DIR"  "$PET_DB_NAME"  "$PET_DB_USER"  "$PET_DB_PASS"  "$PET_LIVE_URL"  "$PET_LOCAL_URL"  "pet-store.sql"
setup_store "$AUTO_DIR" "$AUTO_DB_NAME" "$AUTO_DB_USER" "$AUTO_DB_PASS" "$AUTO_LIVE_URL" "$AUTO_LOCAL_URL" "auto-store.sql"

echo "=============================================="
echo " Initialization complete!"
echo " Next steps:"
echo "  1. Update Stripe secret key in WooCommerce settings on both stores"
echo "  2. Point DNS for furlio.au + letsdrive.au to this server"
echo "  3. Test: curl -I https://furlio.au && curl -I https://letsdrive.au"
echo "=============================================="
