# Standard Operating Procedures — Dropshipping Empire

---

## SOP 1 — Daily Start-of-Day Routine

Run this every morning before doing anything else, especially after a WSL2 reboot.

### Step 1 — Start Local Services

```bash
cd ~/claude/DROPSHIPPING
bash start.sh
```

Or manually:
```bash
sudo service apache2 start
sudo service mariadb start
```

### Step 2 — Verify Stores Are Up

```bash
curl -s http://localhost/pet/ | grep -o "<title>.*</title>"
curl -s http://localhost/auto/ | grep -o "<title>.*</title>"
```

Expected output: something like `<title>Furlio...</title>` and `<title>LetsDrive...</title>`.

If you see a blank or error, check Apache logs:
```bash
sudo tail -20 /var/log/apache2/error.log
```

### Step 3 — Run the AI CEO

```bash
bash ceo.sh
```

The CEO agent will automatically:
- Pull 7-day WooCommerce sales metrics for both stores
- Scrape competitor sites (PetBarn, SuperCheapAuto, Amazon AU)
- Run product scouting (finds 5 new products per niche via AliExpress/DHgate)
- Generate and publish SEO blog posts
- Post to social media via MixPost (once configured)
- Send a Telegram briefing to your phone
- Save a text report to `reports/ceo_briefing_YYYY-MM-DD.txt`

**Flags you can use:**
```bash
bash ceo.sh --dry-run         # Plan + competitor analysis only, no scouting
bash ceo.sh --niche pet       # Run for Furlio only
bash ceo.sh --niche auto      # Run for LetsDrive only
bash ceo.sh --brief-only      # Just send today's Telegram briefing
```

### Step 4 — Review the Briefing

Check what the CEO recommended:
```bash
cat reports/ceo_briefing_$(date +%F).txt
```

Or wait for the Telegram message on your phone.

Act on any **CRITICAL** or **HIGH** priority owner action items listed in the briefing.

### Step 5 — Check Logs If Anything Seems Off

```bash
tail -50 logs/ceo_$(date +%F).log
```

### Step 6 — End of Day

No manual action needed — the crontab handles everything:
- `04:00 AEST` — `master.sh` runs scouting + social + sync
- `08:45 AEST` — `report.py` sends the sales report

---

## SOP 2 — Adding a New Dropshipping Niche

Use this when you want to add a third (or fourth) store, e.g., garden, fitness, home decor, baby products.

### Phase A — Plan the Niche

Before touching any code, decide:

| Decision | Example |
|----------|---------|
| Niche name (slug) | `garden` |
| Store name | `GreenMate` |
| Domain | `greenmate.au` |
| Price range AUD | $20–$300 |
| Categories (4-6) | Outdoor Furniture, Garden Tools, Planters, Irrigation, Lighting, Decor |
| Target margin | 55% |
| Brand voice | "Friendly Aussie gardener. Down-to-earth, practical." |
| Supplier categories | AliExpress garden, DHgate outdoor |
| Competitor sites | Bunnings, Garden Express, Amazon AU Garden |

### Phase B — Set Up WordPress

**1. Create the database:**
```bash
sudo mysql -u root -pRoot@1234 -e "
CREATE DATABASE wp_garden CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON wp_garden.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;"
```

**2. Install WordPress:**
```bash
sudo wp core download --path=/var/www/html/garden --allow-root
sudo wp config create \
  --path=/var/www/html/garden \
  --dbname=wp_garden \
  --dbuser=wpuser \
  --dbpass=WpLocal2024\! \
  --dbhost=localhost \
  --allow-root
sudo wp core install \
  --path=/var/www/html/garden \
  --url=http://localhost/garden \
  --title="GreenMate" \
  --admin_user=admin \
  --admin_password=Admin@Local2024\! \
  --admin_email=hello@greenmate.au \
  --allow-root
sudo chown -R www-data:www-data /var/www/html/garden
sudo chmod 644 /var/www/html/garden/wp-config.php
```

**3. Install WooCommerce + essential plugins:**
```bash
sudo wp plugin install woocommerce astra-sites yoast-seo wp-super-cache contact-form-7 \
  --activate --path=/var/www/html/garden --allow-root
```

**4. Add the critical MU plugin** (fixes WC REST API auth on local HTTP):
```bash
sudo mkdir -p /var/www/html/garden/wp-content/mu-plugins
sudo cp /var/www/html/pet/wp-content/mu-plugins/api-auth-fix.php \
        /var/www/html/garden/wp-content/mu-plugins/
```

**5. Create `.htaccess`:**
```bash
sudo tee /var/www/html/garden/.htaccess > /dev/null << 'EOF'
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /garden/
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /garden/index.php [L]
</IfModule>
# END WordPress
EOF
```

**6. Generate WooCommerce API keys** (do this via WP Admin):
- Go to `http://localhost/garden/wp-admin` → WooCommerce → Settings → Advanced → REST API
- Add key: Description "CEO Agent", Permissions "Read/Write"
- Copy the Consumer Key and Consumer Secret

**7. Generate WordPress Application Password** (for blog posts):
- Go to Users → Profile → Application Passwords
- Name: "CEO Agent", click Add New
- Copy the password (no spaces needed)

### Phase C — Add the Niche to config.json

Open `config.json` and add to the `niches` object:

```json
"garden": {
  "enabled": true,
  "store_name": "GreenMate",
  "domain": "greenmate.au",
  "local_wp_path": "/var/www/html/garden",
  "wp_content_path": "/var/www/html/garden/wp-content",
  "wp_url_local": "http://localhost/garden",
  "wp_url_live": "https://greenmate.au",
  "wp_user": "admin",
  "wp_app_password": "PASTE_APP_PASSWORD_HERE",
  "woocommerce_consumer_key": "ck_PASTE_HERE",
  "woocommerce_consumer_secret": "cs_PASTE_HERE",
  "store_email": "hello@greenmate.au",
  "brand_voice": "Friendly Aussie gardener. Down-to-earth, practical. Use phrases like 'perfect for the backyard', 'Aussie-grown', 'built for our climate'.",
  "categories": ["Outdoor Furniture", "Garden Tools", "Planters", "Irrigation", "Lighting", "Decor"],
  "target_keywords": ["garden supplies Australia", "outdoor furniture Australia", "garden tools online", "free shipping garden"],
  "supplier_urls": [
    "https://www.aliexpress.com/category/garden.html",
    "https://www.dhgate.com/wholesale/garden+supplies.html"
  ],
  "trending_sources": [
    "https://www.bunnings.com.au/specials",
    "https://www.amazon.com.au/bestsellers/garden"
  ],
  "target_margin_pct": 55,
  "min_price_aud": 20,
  "max_price_aud": 300,
  "shipping_requirement": "AU_LOCAL_OR_FAST",
  "fastcomet": {
    "host": "YOUR_FASTCOMET_SERVER_IP",
    "user": "YOUR_SSH_USER",
    "port": 22,
    "ssh_key": "/home/dsights/.ssh/fastcomet_garden_rsa",
    "remote_wp_path": "/home/YOUR_USER/public_html_garden",
    "remote_db_name": "YOUR_GARDEN_DB_NAME",
    "remote_db_user": "YOUR_GARDEN_DB_USER",
    "remote_db_pass": "YOUR_GARDEN_DB_PASS"
  },
  "social_media": {
    "tiktok_account": "@greenmate.au",
    "instagram_account": "@greenmate.au",
    "pinterest_board": "GreenMate Garden Finds"
  }
}
```

### Phase D — Add Competitor Sources to ceo.py

Open `_common/ceo.py`, find `COMPETITOR_SOURCES`, and add:

```python
"garden": [
    {"name": "Bunnings Specials",    "url": "https://www.bunnings.com.au/specials"},
    {"name": "Amazon AU Garden",     "url": "https://www.amazon.com.au/gp/bestsellers/garden/"},
    {"name": "Garden Express Sale",  "url": "https://www.gardenexpress.com.au/"},
],
```

Also update the `niche` enum in the tool definitions (CEO_TOOLS) to include `"garden"`:
```python
"enum": ["pet", "auto", "garden"]
```
(There are 4-5 places in CEO_TOOLS where this enum appears — update all of them.)

### Phase E — Seed Initial Products

```bash
bash venv/bin/python3 seed_products.py garden
```

### Phase F — Verify Everything Works

```bash
# Test WC REST API for the new store
curl "http://localhost/garden/index.php?rest_route=/wc/v3/products" \
  -u "ck_YOURKEYHERE:cs_YOURSECRETHERE"

# Run CEO in dry-run for new niche only
bash ceo.sh --dry-run --niche garden
```

---

## SOP 3 — Adding a New Dropshipping Partner and Their Products

Use this when you want to source from a new supplier (beyond AliExpress/DHgate/CJ Dropshipping).

### Step 1 — Evaluate the Supplier

Before adding, confirm:
- [ ] They ship to Australia
- [ ] Delivery time under 15 business days (ideally 7–10)
- [ ] Product prices leave a 55%+ margin after AUD conversion
- [ ] They have an API, CSV export, or accessible product catalogue

### Step 2 — Add Partner to config.json

Under the relevant niche, add or extend a `suppliers` section:

```json
"suppliers": {
  "cjdropshipping": {
    "enabled": true,
    "api_url": "https://developers.cjdropshipping.com/api2.0/v1",
    "api_key": "CJ5344548@api@c2e02df5c8ff4fbcada15a84e0b07c6c"
  },
  "aliexpress": {
    "enabled": true,
    "scrape_urls": [
      "https://www.aliexpress.com/category/200001075/pet-products.html"
    ]
  },
  "my_new_supplier": {
    "enabled": true,
    "name": "AussiePetWholesale",
    "api_url": "https://api.aussiepet.com.au/v1",
    "api_key": "YOUR_API_KEY_HERE",
    "notes": "AU-based warehouse, 3-day delivery, min order $0"
  }
}
```

### Step 3 — Add a Product Import Script

Create `_common/import_SUPPLIERNAME.py`:

```python
#!/usr/bin/env python3
"""Import products from MySupplier into WooCommerce."""
import json, sys, httpx
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "_common"))
from db import get_conn, get_wp_url, api_url, insert_product, update_product_status

with open(ROOT / "config.json") as f:
    CFG = json.load(f)

NICHE = sys.argv[1] if len(sys.argv) > 1 else "pet"
ncfg = CFG["niches"][NICHE]
supplier_cfg = ncfg["suppliers"]["my_new_supplier"]

def fetch_supplier_products():
    """Call the supplier API and return a list of raw product dicts."""
    r = httpx.get(
        f"{supplier_cfg['api_url']}/products",
        headers={"Authorization": f"Bearer {supplier_cfg['api_key']}"},
        params={"category": "pet", "in_stock": True, "limit": 50},
        timeout=30,
    )
    r.raise_for_status()
    return r.json()["products"]

def calculate_sale_price(supplier_price_aud: float, margin_pct: float) -> float:
    return round(supplier_price_aud / (1 - margin_pct / 100), 2)

def publish_to_woocommerce(product: dict) -> int | None:
    base_url = get_wp_url(ncfg, CFG["global"])
    ck, cs = ncfg["woocommerce_consumer_key"], ncfg["woocommerce_consumer_secret"]
    r = httpx.post(
        api_url(base_url, "/wc/v3/products"),
        auth=(ck, cs),
        json={
            "name": product["title"],
            "type": "simple",
            "regular_price": str(product["sale_price"]),
            "description": product["description"],
            "status": "publish",
            "images": [{"src": u} for u in product.get("image_urls", [])[:5]],
        },
        timeout=30,
    )
    if r.status_code == 201:
        return r.json()["id"]
    print(f"WooCommerce publish failed: {r.status_code} {r.text[:200]}")
    return None

def main():
    conn = get_conn(CFG["global"]["db_path"])
    raw_products = fetch_supplier_products()
    margin = ncfg["target_margin_pct"]

    for raw in raw_products:
        supplier_price = float(raw["price_aud"])
        sale_price = calculate_sale_price(supplier_price, margin)

        # Skip if outside our price range
        if not (ncfg["min_price_aud"] <= sale_price <= ncfg["max_price_aud"]):
            continue

        product = {
            "supplier_url": raw.get("url", ""),
            "supplier_price": supplier_price,
            "sale_price": sale_price,
            "margin_pct": margin,
            "title": raw["name"],
            "description": raw.get("description", ""),
            "blog_post": "",
            "image_urls": json.dumps(raw.get("images", [])),
            "status": "pending",
        }
        db_id = insert_product(conn, NICHE, product)
        woo_id = publish_to_woocommerce({**product, "image_urls": raw.get("images", [])})
        if woo_id:
            update_product_status(conn, db_id, "published", woo_product_id=woo_id)
            print(f"Published: {raw['name']} (WC ID: {woo_id})")

    conn.close()

if __name__ == "__main__":
    main()
```

### Step 4 — Run the Import

```bash
venv/bin/python3 _common/import_SUPPLIERNAME.py pet
venv/bin/python3 _common/import_SUPPLIERNAME.py auto
```

### Step 5 — Verify Products Appeared in WooCommerce

```bash
# Count published products
curl -s "http://localhost/pet/index.php?rest_route=/wc/v3/products&per_page=1&status=publish" \
  -u "ck_3615c40125f01ecafe992c962c8f67dd1d9a39ca:cs_b58df0efbd2eea66e52e936e03ea36a38f505a25" \
  | grep -o '"X-WP-Total": "[0-9]*"' || true

# Or open WP Admin → Products
open http://localhost/pet/wp-admin/edit.php?post_type=product
```

### Step 6 — Add Supplier to scout.py (Optional — For Ongoing Auto-Import)

If the supplier has a public catalogue or API you can scrape, add it to `_common/scout.py` in the `SUPPLIER_URLS` section for the relevant niche. The AI scout agent will automatically pull new products from it daily at 04:00 AEST.

### Step 7 — Test the Full Pipeline

```bash
bash ceo.sh --niche pet --dry-run   # Check CEO sees the new products
```

---

## Quick Reference — Key Files

| File | When You Need It |
|------|-----------------|
| `config.json` | Credentials, API keys, niche settings |
| `_common/ceo.py` | CEO agent logic, competitor sources, tool definitions |
| `_common/scout.py` | Daily product scraping agent |
| `_common/hype.py` | Social media content generator |
| `_common/report.py` | Daily Telegram sales report |
| `_common/db.py` | SQLite helpers + `api_url()` |
| `master.sh` | Cron orchestrator (runs 04:00 AEST) |
| `ceo.sh` | Manual CEO run |
| `start.sh` / `stop.sh` | Start/stop Apache + MariaDB |
| `STATUS.md` | Single source of truth — all credentials + known issues |
| `logs/` | All run logs (ceo, master, scout, hype, report) |
| `reports/` | Daily CEO briefings as text files |
| `db/products.db` | SQLite product + social post database |
| `db/ceo_state.json` | CEO learning memory — milestones, learnings, plans |

## Quick Reference — Common Commands

```bash
# Start day
bash start.sh && bash ceo.sh

# Run CEO dry-run (no scraping, just analysis + briefing)
bash ceo.sh --dry-run

# Check today's CEO log
tail -f logs/ceo_$(date +%F).log

# Check today's briefing
cat reports/ceo_briefing_$(date +%F).txt

# Check WC API is working
curl -s "http://localhost/pet/index.php?rest_route=/wc/v3/products" \
  -u "ck_3615c40125f01ecafe992c962c8f67dd1d9a39ca:cs_b58df0efbd2eea66e52e936e03ea36a38f505a25" | python3 -m json.tool | head -20

# Check product count
curl -s "http://localhost/pet/index.php?rest_route=/wc/v3/products&per_page=1" \
  -u "ck_3615c40125f01ecafe992c962c8f67dd1d9a39ca:cs_b58df0efbd2eea66e52e936e03ea36a38f505a25" -I | grep X-WP-Total

# View SQLite product DB
sqlite3 db/products.db "SELECT niche, status, COUNT(*) FROM products GROUP BY niche, status;"

# Stop services at end of day
bash stop.sh
```

## Pending Actions (as of 2026-04-25)

These must be done by you before the stores can go live:

| Priority | Action | Time |
|----------|---------|------|
| CRITICAL | Fix Apache vhost: `! sudo bash /tmp/fix_apache.sh` | 1 min |
| CRITICAL | Telegram: send `/start` to your bot | 1 min |
| HIGH | FastComet: fill in SSH credentials in config.json for both stores | 15 min |
| HIGH | SSH keys: `ssh-keygen -t rsa -b 4096 -f ~/.ssh/fastcomet_pet_rsa` (and `fastcomet_auto_rsa`) | 5 min |
| HIGH | GitHub SSH key: add to GitHub account so `git push` works | 5 min |
| MEDIUM | MixPost: install + paste API token into config.json | 30 min |
| MEDIUM | Domain DNS: point `furlio.au` and `letsdrive.au` to FastComet | 15 min |
| LOW | Run `bash _common/sync.sh` after steps above to deploy both stores | 2 min |
