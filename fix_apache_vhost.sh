#!/usr/bin/env bash
# Fix Apache vhost conflict — both pet.conf and auto.conf use ServerName localhost
# which causes Apache to only honour one. Fix: merge both into 000-default.conf.
# Safe to run multiple times.
set -euo pipefail

echo "[APACHE FIX] Merging pet + auto Directory blocks into 000-default.conf..."

DEFAULT_CONF="/etc/apache2/sites-available/000-default.conf"
PET_CONF="/etc/apache2/sites-available/pet.conf"
AUTO_CONF="/etc/apache2/sites-available/auto.conf"

# Backup
cp "$DEFAULT_CONF" "${DEFAULT_CONF}.bak.$(date +%F)"
echo "[APACHE FIX] Backed up 000-default.conf"

# Build the new 000-default.conf with both store blocks inside ONE VirtualHost
cat > "$DEFAULT_CONF" <<'EOF'
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    # ── Furlio (Pet Store) ──────────────────────────────────────
    Alias /pet /var/www/html/pet
    <Directory /var/www/html/pet>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteBase /pet/
            RewriteRule ^index\.php$ - [L]
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteCond %{REQUEST_FILENAME} !-d
            RewriteRule . /pet/index.php [L]
        </IfModule>
    </Directory>

    # ── LetsDrive (Auto Store) ──────────────────────────────────
    Alias /auto /var/www/html/auto
    <Directory /var/www/html/auto>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
        <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteBase /auto/
            RewriteRule ^index\.php$ - [L]
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteCond %{REQUEST_FILENAME} !-d
            RewriteRule . /auto/index.php [L]
        </IfModule>
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

echo "[APACHE FIX] 000-default.conf written."

# Disable the conflicting separate vhost files
a2dissite pet.conf 2>/dev/null && echo "[APACHE FIX] Disabled pet.conf" || echo "[APACHE FIX] pet.conf already disabled or missing"
a2dissite auto.conf 2>/dev/null && echo "[APACHE FIX] Disabled auto.conf" || echo "[APACHE FIX] auto.conf already disabled or missing"

# Make sure 000-default is enabled and mod_rewrite is on
a2ensite 000-default.conf
a2enmod rewrite

# Reload Apache
if service apache2 reload; then
    echo "[APACHE FIX] Apache reloaded."
else
    echo "[APACHE FIX] Reload failed — trying restart..."
    service apache2 restart
fi

echo ""
echo "[APACHE FIX] Done. Verify:"
echo "  curl -sI http://localhost/pet/ | grep HTTP"
echo "  curl -sI http://localhost/auto/ | grep HTTP"
