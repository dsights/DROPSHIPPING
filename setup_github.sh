#!/bin/bash
set -e

EMAIL="dsightstech@gmail.com"
REPO="git@github.com:dsights/dropshipping-empire.git"

echo "=== Generating GitHub SSH key ==="
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo ""
echo "=== Your GitHub Public Key (add this to GitHub) ==="
echo "Go to: https://github.com/settings/ssh/new"
echo "Title: dropshipping-wsl2"
echo "Key:"
echo "------------------------------------------------------------"
cat ~/.ssh/id_ed25519.pub
echo "------------------------------------------------------------"
echo ""
echo "Press ENTER after you have added the key to GitHub..."
read -r

echo "=== Testing GitHub connection ==="
ssh -T git@github.com 2>&1 || true

echo ""
echo "=== Setting up git remotes ==="
cd /var/www/html/pet
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO"
git branch -M main
echo "Pet remote set"

cd /var/www/html/auto
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO"
git branch -M main
echo "Auto remote set"

echo ""
echo "=== Pushing pet store ==="
cd /var/www/html/pet
git add -A
git commit -m "Initial WordPress + WooCommerce setup - pet store" --author="Dropship Bot <dsightstech@gmail.com>" 2>/dev/null || echo "Nothing new to commit"
git push -u origin main

echo ""
echo "=== Pushing auto store ==="
cd /var/www/html/auto
git add -A
git commit -m "Initial WordPress + WooCommerce setup - auto store" --author="Dropship Bot <dsightstech@gmail.com>" 2>/dev/null || echo "Nothing new to commit"
git push -u origin main

echo ""
echo "=== GitHub setup complete ==="
echo "Repo: https://github.com/dsights/dropshipping-empire"
