#!/bin/bash
# Run as root: sudo bash fix_root_ssh.sh
# Copies GitHub SSH key to root's .ssh so git push works when running as root

set -e

echo "[1/4] Creating /root/.ssh..."
mkdir -p /root/.ssh
chmod 700 /root/.ssh

echo "[2/4] Copying SSH keys to root..."
cp /home/dsights/.ssh/github_dropshipping      /root/.ssh/github_dropshipping
cp /home/dsights/.ssh/github_dropshipping.pub  /root/.ssh/github_dropshipping.pub
chmod 600 /root/.ssh/github_dropshipping

cp /home/dsights/.ssh/fastcomet_deploy      /root/.ssh/fastcomet_deploy
cp /home/dsights/.ssh/fastcomet_deploy.pub  /root/.ssh/fastcomet_deploy.pub
chmod 600 /root/.ssh/fastcomet_deploy

echo "[3/4] Writing SSH config for root..."
cat > /root/.ssh/github_config << 'EOF'

Host github.com
    HostName github.com
    User git
    IdentityFile /root/.ssh/github_dropshipping
    IdentitiesOnly yes
EOF

# Append to config if not already there
if ! grep -q "github_dropshipping" /root/.ssh/config 2>/dev/null; then
    cat /root/.ssh/github_config >> /root/.ssh/config
    chmod 600 /root/.ssh/config
fi
rm -f /root/.ssh/github_config

echo "[4/4] Testing GitHub auth..."
ssh -T git@github.com 2>&1 || true

echo ""
echo "Done. If you saw 'Hi dsights! You've successfully authenticated' above,"
echo "you can now run:  git push origin main"
