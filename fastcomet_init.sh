#!/bin/bash
# ====================================================================
# FastComet WordPress Initialization Script
# Run this script ON your FastComet server via SSH.
# It downloads WordPress core files, connects to the database, 
# imports your SQL dumps, and replaces localhost URLs with live URLs.
# ====================================================================

# --- 1. CONFIGURATION ---
# Fill in your FastComet database details below. 
# You need to create these databases and users in cPanel first.

# Pet Store (Furlio)
PET_DIR="/home/tripxen1/dropshipping/public_html/pet-store" # IMPORTANT: Point to root directory. DO NOT append /wp-content
PET_DB_NAME="tripxen1_petdb"
PET_DB_USER="tripxen1_petuser"
PET_DB_PASS="your_pet_db_password"
PET_LIVE_URL="https://furlio.au"
PET_LOCAL_URL="http://localhost/pet"

# Auto Store (LetsDrive)
AUTO_DIR="/home/tripxen1/dropshipping/public_html/auto-store" # IMPORTANT: Point to root directory. DO NOT append /wp-content
AUTO_DB_NAME="tripxen1_autodb"
AUTO_DB_USER="tripxen1_autouser"
AUTO_DB_PASS="your_auto_db_password"
AUTO_LIVE_URL="https://letsdrive.au"
AUTO_LOCAL_URL="http://localhost/auto"

# --------------------------------------------------------------------

setup_store() {
    local dir=$1
    local db_name=$2
    local db_user=$3
    local db_pass=$4
    local live_url=$5
    local local_url=$6
    local sql_file=$7

    echo "=================================================="
    echo " Setting up store in: $dir"
    echo "=================================================="

    if [ ! -d "$dir" ]; then
        echo "Error: Directory $dir does not exist."
        echo "Make sure the GitHub Action has deployed your files first!"
        return 1
    fi

    cd "$dir" || return 1

    # Ensure WP-CLI is available
    local wp_cmd="wp"
    if ! command -v wp &> /dev/null; then
        echo "WP-CLI not found in PATH. Downloading locally..."
        curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        wp_cmd="./wp-cli.phar"
    fi

    # Download WP core files (skipping wp-content which is already there)
    echo "-> Downloading WordPress core files..."
    $wp_cmd core download --skip-content --force

    # Create wp-config.php
    echo "-> Creating wp-config.php..."
    $wp_cmd config create --dbname="$db_name" --dbuser="$db_user" --dbpass="$db_pass" --force

    # Import the database
    if [ -f "$sql_file" ]; then
        echo "-> Importing database from $sql_file..."
        $wp_cmd db import "$sql_file"

        # Search and Replace local URLs with live domain
        echo "-> Updating URLs from $local_url to $live_url..."
        $wp_cmd search-replace "$local_url" "$live_url" --all-tables --quiet
    else
        echo "-> WARNING: Database dump ($sql_file) not found in $dir."
    fi

    # Fix file permissions for security and functionality
    echo "-> Fixing permissions..."
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;

    # Clear WP cache
    echo "-> Flushing WordPress cache..."
    $wp_cmd cache flush

    echo "-> Done with $dir!"
    echo ""
}

echo "Starting FastComet Initialization..."

setup_store "$PET_DIR" "$PET_DB_NAME" "$PET_DB_USER" "$PET_DB_PASS" "$PET_LIVE_URL" "$PET_LOCAL_URL" "pet-store.sql"
setup_store "$AUTO_DIR" "$AUTO_DB_NAME" "$AUTO_DB_USER" "$AUTO_DB_PASS" "$AUTO_LIVE_URL" "$AUTO_LOCAL_URL" "auto-store.sql"

echo "=================================================="
echo "All actions completed. Please check your live sites!"
echo "=================================================="
