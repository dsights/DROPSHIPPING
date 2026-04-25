#!/usr/bin/env bash
[ -n "${BASH_VERSION:-}" ] || exec bash "$0" "$@"
set -e
echo "Stopping local DROPSHIPPING services..."

# Stop Apache2
sudo service apache2 stop

# Stop MariaDB
sudo service mariadb stop

echo "Services have been successfully stopped."
