#!/usr/bin/env bash
[ -n "${BASH_VERSION:-}" ] || exec bash "$0" "$@"
set -e
echo "Starting local DROPSHIPPING services..."

# Start Apache2
sudo service apache2 start

# Start MariaDB
sudo service mariadb start

echo "Services have been successfully started."
echo "Your websites should now be accessible at http://localhost/<niche>"
