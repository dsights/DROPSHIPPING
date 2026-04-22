# Master Setup Prompt — Autonomous Dropshipping Empire

Use this prompt to give Claude full context and instructions to set up the entire stack from scratch, or resume from any step.

---

## PROMPT (copy-paste to Claude)

```
I am building an Autonomous Dropshipping Empire on WSL2 (Ubuntu).
Project directory: /home/dsights/claude/DROPSHIPPING
Email: dsightstech@gmail.com

STACK:
- Apache2 + PHP 8.3 + MariaDB (LAMP on WSL2, no Docker)
- WordPress + WooCommerce per niche (currently: pet, auto)
- Python venv with anthropic, playwright, browser-use
- WP-CLI for WordPress management
- Crontab running master.sh daily at 04:00 AEST

KEY CREDENTIALS (local dev only):
- MariaDB root password: Root@1234
- WordPress DB user: wpuser / WpLocal2024!
- WordPress admin login: admin / Admin@Local2024!
- Databases: wp_pet, wp_auto

STORES:
- Pet:  http://localhost/pet   → AussiePaw Co.     (/var/www/html/pet)
- Auto: http://localhost/auto  → RiggedUp Auto      (/var/www/html/auto)

SCRIPTS (run in this order for fresh setup):
1. bash install_stack.sh       → LAMP + WP + WooCommerce + plugins
2. bash setup.sh               → Python venv + playwright
3. bash post_install.sh        → WP app passwords + WooCommerce API keys + crontab

KNOWN ISSUES / QUIRKS:
- sudo requires interactive terminal — always prompt user to run sudo commands
- MariaDB root auth uses password Root@1234 (socket auth disabled)
- WP-CLI must run as dsights user (not sudo/www-data) — wp-config.php must be owned by dsights
- Bash history expansion breaks passwords with ! — use # instead or escape with \!
- Long commands break when pasted with line wraps — write to .sh file and run with bash instead
- Commands with sudo that cannot run non-interactively: write to a .sh file, ask user to run with sudo bash

WHAT IS DONE:
- Steps 1–9 of LAMP+WP setup complete (see STATUS.md for full breakdown)
- post_install.sh run successfully — WooCommerce keys + App passwords saved to config.json
- Crontab installed (04:00 AEST master.sh + 08:45 AEST report.py)
- Git repos initialized in /var/www/html/pet and /var/www/html/auto

WHAT IS PENDING (in priority order):
1. config.json → claude.api_key (Anthropic API key)
2. config.json → telegram.bot_token + chat_id
3. config.json → github.repo_url → then push both WP repos to GitHub
4. config.json → niches.pet.fastcomet (host, user, ssh_key, remote paths, DB creds)
5. config.json → niches.auto.fastcomet (same as above)
6. Generate SSH keys: ssh-keygen -t rsa -b 4096 -f ~/.ssh/fastcomet_pet_rsa -N ""
7. Upload SSH public keys to FastComet SSH Manager
8. Test full pipeline: venv/bin/python3 _common/scout.py pet
9. Verify crontab fires: check logs/cron_master.log after 04:00 AEST

Please continue from the pending steps above. Prompt me for sudo when needed. 
Write multi-command scripts to a .sh file and ask me to run them rather than 
chaining long inline commands.
```

---

## When to use this prompt
- Starting a new Claude Code session to continue work
- After system restart (WSL2 services need restarting: `sudo service apache2 start && sudo service mariadb start`)
- To hand off context to a new Claude instance

## WSL2 service restart reminder
After every WSL2 reboot, services stop. Always run:
```bash
sudo service apache2 start && sudo service mariadb start
```
