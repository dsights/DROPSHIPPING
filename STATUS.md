# Project Status — Autonomous Dropshipping Empire
Last updated: 2026-04-20

---

## Infrastructure — DONE

| Step | Task | Status |
|------|------|--------|
| 1 | Apache2 + PHP 8.3 + MariaDB installed | DONE |
| 2 | Services started (apache2, mariadb) | DONE — restart needed after each WSL2 reboot |
| 3 | Databases wp_pet + wp_auto created | DONE |
| 4 | WP-CLI installed (/usr/local/bin/wp) | DONE |
| 5 | PHP tuned (64M upload, 256M memory, 300s timeout) | DONE |
| 6 | WordPress + WooCommerce installed × 2 | DONE |
| 7 | Storefront → Astra theme installed + branded × 2 | DONE |
| 8 | Apache vhosts configured (pet.conf, auto.conf) | DONE |
| 9 | config.json paths + credentials | DONE |
| 10 | WooCommerce REST API keys + App passwords | DONE |
| 11 | Crontab installed (04:00 AEST master.sh, 08:45 AEST report.py) | DONE |
| 12 | Git repos initialized | DONE |
| 13 | Python venv + anthropic + playwright + browser-use + langchain-anthropic | DONE |

---

## Stores — LOCAL

| Store | URL | Admin URL | Status |
|-------|-----|-----------|--------|
| Furlio (pet) | http://localhost/pet | http://localhost/pet/wp-admin | LIVE (local) ✅ |
| LetsDrive (auto) | http://localhost/auto | http://localhost/auto/wp-admin | LIVE (local) ✅ |

**WordPress admin login (both stores):** `admin / Admin@Local2024!`

---

## WooCommerce Configuration — DONE

| Setting | Pet Store | Auto Store |
|---------|-----------|------------|
| Theme | Astra (ocean blue/coral palette) | Astra (dark steel/burnt orange palette) |
| Fonts | Playfair Display + Nunito | Oswald + Barlow |
| Currency | AUD | AUD |
| Country | Australia only | Australia only |
| Shipping: Standard | $8.95 flat rate | $9.95 flat rate |
| Shipping: Free | Orders $75+ | Orders $100+ |
| Tax | 10% GST (AU) | 10% GST (AU) |
| Coming Soon | OFF | OFF |
| Reviews | ON (verified only) | ON (verified only) |
| Catalog | 3 cols × 4 rows, 12/page | 3 cols × 4 rows, 12/page |
| Homepage | Custom hero + categories + products + newsletter | Custom hero + categories + products + newsletter |
| Pages | Shop, Cart, Checkout, My Account, About, Contact, FAQ, Shipping Info, Privacy, Refund | Same |
| Navigation | Primary menu: Home, Shop, About, FAQ, Shipping, Contact | Same |
| Footer | 3 widgets: About/CTA, Quick Links, Contact+Payment badges | Same |
| Payment | Stripe (live mode) + PayPal + COD | Same |
| Email from | hello@furlio.au | hello@letsdrive.au |
| SEO | Yoast configured: meta titles, breadcrumbs, noindex utility pages | Same |
| Cache | WP Super Cache enabled | Same |
| Products | 6 seeded via Claude API (seed_products.py) | Same |

---

## Credentials — Local Dev

### MariaDB
| Item | Value |
|------|-------|
| Root password | `Root@1234` |
| WP DB user | `wpuser` |
| WP DB password | `WpLocal2024!` |
| Pet database | `wp_pet` |
| Auto database | `wp_auto` |

### Pet Store (Furlio)
| Item | Value |
|------|-------|
| WP App Password | `nZUpfSqdm0zTeVfKCNWqKC3C` |
| WooCommerce Consumer Key | `ck_3615c40125f01ecafe992c962c8f67dd1d9a39ca` |
| WooCommerce Consumer Secret | `cs_b58df0efbd2eea66e52e936e03ea36a38f505a25` |
| Local path | `/var/www/html/pet` |
| Local URL | `http://localhost/pet` |
| Live domain | `furlio.au` |

### Auto Store (LetsDrive)
| Item | Value |
|------|-------|
| WP App Password | `gcgwavt6omwrQjn7Doa98I2i` |
| WooCommerce Consumer Key | `ck_ee4faf0b9944d95164307fb61d316fa0423e90dd` |
| WooCommerce Consumer Secret | `cs_71064ddaff4731d0cdd8d0616b19727645042644` |
| Local path | `/var/www/html/auto` |
| Local URL | `http://localhost/auto` |
| Live domain | `letsdrive.au` |

### Stripe (Live Mode)
| Item | Value |
|------|-------|
| Publishable Key | `pk_live_51TODJwA3dqys8x5WeTSTxvfKxEXYR1Un4uf0UP2e4HrTILZnnjjLkczfsJxpdJd5qPgfMdmvkZ4HpAipCLyD9k9P00csNcvDha` |
- **Stripe Secret Key**: `[REDACTED_STRIPE_SECRET_KEY]`

### CJDropshipping
| Item | Value |
|------|-------|
| API Key | `CJ5344548@api@c2e02df5c8ff4fbcada15a84e0b07c6c` |

### Gmail
| Item | Value |
|------|-------|
| Address | `savenest.au@gmail.com` |

---

## Known Issues / Debug Notes

### Apache Authorization Header Stripping (RESOLVED)
**Problem:** Apache mod_php strips the `Authorization` header. WooCommerce REST API uses Basic Auth
for API key auth, requiring this header. Additionally, WC only performs Basic Auth on HTTPS.

**Fix applied:**
- MU plugin at `wp-content/mu-plugins/api-auth-fix.php` on both stores:
  1. Recovers `Authorization` header from various server variables
  2. Sets `$_SERVER['HTTPS'] = 'on'` for REST API requests only (so WC uses Basic Auth)
  3. Adds filter `woocommerce_rest_is_request_to_rest_api` to detect `?rest_route=` URLs
- All Python scripts use `?rest_route=` URL format instead of `/wp-json/` (avoids Apache rewrite dependency)
- Helper `api_url(base_url, route)` function in `_common/db.py`

**DO NOT remove** `api-auth-fix.php` MU plugins — WC REST API will break without them.

### wp-config.php Permissions (RESOLVED)
**Problem:** Editing wp-config.php via Claude Code tools changes file permissions to 640 (owner-only read),
blocking Apache (www-data) from reading it → 500 errors on all pages.

**Fix:** After any wp-config.php edit, run: `chmod 644 /var/www/html/pet/wp-config.php /var/www/html/auto/wp-config.php`

**Current permissions:** 644 ✅

### Apache Rewrite / wp-json Pretty URLs
**Problem:** Both stores share `ServerName localhost` in vhost configs. Apache uses the first vhost
matched (auto.conf alphabetically), so `/pet` URL rewrites only work for `/auto`. Additionally,
`apache2.conf` has `AllowOverride None` for `/var/www/`, so `.htaccess` in `/pet` is ignored.
Result: pet store returns an infinite 301 redirect to itself.

**Workaround:** All API calls use `?rest_route=` fallback. Browser auto store works via auto.conf Directory block.

**Permanent fix (requires sudo) — script ready at /tmp/fix_apache.sh:**
```bash
sudo bash /tmp/fix_apache.sh
```
This consolidates both store Directory blocks into `000-default.conf` and disables the conflicting auto.conf + pet.conf vhosts.

### auto store MU plugin missing set_url_scheme filter (RESOLVED — 2026-04-24)
**Problem:** Auto store's `api-auth-fix.php` set `HTTPS=on` globally but lacked the `set_url_scheme`
filter. WordPress redirected REST API calls to `https://localhost/auto/` causing report.py to fail.

**Fix:** Added `set_url_scheme` filter to `/var/www/html/auto/wp-content/mu-plugins/api-auth-fix.php`
(matching what the pet store already had) — converts `https://localhost` back to `http://localhost`.

### report.py WooCommerce API issues (RESOLVED — 2026-04-24)
**Problem 1:** `httpx.get(api_url(...), params={...})` dropped the `rest_route` from the URL, causing 301 loops.
**Fix:** Embed all extra params directly in the URL string via `api_url()` argument.

**Problem 2:** `/wc/v3/reports/sales` does not support `period=custom` in WooCommerce 10.x. Returns 400.
**Fix:** Switched to `/wc/v3/orders?after=...&before=...` and aggregate totals in Python.

### Pet store plugins deactivated (RESOLVED — 2026-04-24)
**Problem:** All plugins were deactivated (`active_plugins = a:0:{}`), causing WordPress to show the installation screen.
**Fix:** Re-activated 9 plugins via WP-CLI: woocommerce, stripe, paypal, yoast, wp-super-cache, cf7, astra-sites, mailchimp-for-wc, woo-variation-swatches.

### Pet store .htaccess missing (RESOLVED — 2026-04-24)
**Problem:** `/var/www/html/pet/.htaccess` did not exist, so WordPress URL rewriting was broken.
**Fix:** Created `.htaccess` with standard WordPress rewrite rules (RewriteBase /pet/).

---

## Automation Pipeline

```
04:00 AEST daily (crontab)
    └── master.sh
         ├── Phase 1: scout.py [pet] → AI scrapes AliExpress/DHgate, scores + lists on WooCommerce
         ├── Phase 1: scout.py [auto] → same for auto niche
         ├── Phase 2: hype.py [pet] → social posts via MixPost
         ├── Phase 2: hype.py [auto] → same
         └── Phase 3: sync.sh → git push → rsync to FastComet

08:45 AEST daily (crontab)
    └── report.py → aggregates WooCommerce sales → Telegram CEO report
```

---

## NEXT ACTIONS — Remaining Before Production

| # | What | Status |
|---|------|--------|
| 1 | Fix Apache vhost conflict (pet store 301 loop) | READY — run `! sudo bash /tmp/fix_apache.sh` |
| 2 | Telegram bot: send `/start` to bot before reports work | PENDING — user action required |
| 3 | MixPost install + API token | PENDING — social posting blocked until done |
| 4 | FastComet SSH credentials (both stores) | PENDING — fill config.json fastcomet section |
| 5 | SSH keys generated + uploaded to FastComet | PENDING — `ssh-keygen -t rsa -b 4096 -f ~/.ssh/fastcomet_pet_rsa` |
| 6 | GitHub SSH key for git push | PENDING — git push still failing |
| 7 | Domain DNS pointed → furlio.au + letsdrive.au | PENDING |
| 8 | Run sync.sh to deploy both stores live | PENDING — after steps 4-7 done |

---

## COMPLETED — This Session (2026-04-24)

| # | What Was Done |
|---|--------------|
| ✅ | Pet store: re-activated 9 plugins (WooCommerce, Stripe, PayPal, Yoast, WP Super Cache, CF7, Astra Sites, Mailchimp, Variation Swatches) |
| ✅ | Pet store: created missing `.htaccess` with WordPress rewrite rules |
| ✅ | Auto store MU plugin: added `set_url_scheme` filter to prevent HTTPS redirect loops in local dev |
| ✅ | report.py: fixed rest_route URL embedding (httpx dropped param when passed separately) |
| ✅ | report.py: fixed WooCommerce sales API (switched from /reports/sales to /orders endpoint; period=custom not supported in WC 10.x) |
| ✅ | Auto store WooCommerce REST API: confirmed 200 OK (both stores working) |
| ✅ | Product images: confirmed all products have real images (8 pet products, 6 auto products) |
| ✅ | Apache fix script prepared at /tmp/fix_apache.sh (awaiting sudo to apply) |
| ✅ | STATUS.md updated with all new debug notes and resolutions |

---

## COMPLETED — Session (2026-04-19)

| # | What Was Done |
|---|--------------|
| ✅ | Stripe + PayPal payment gateways installed and enabled on both stores |
| ✅ | Auto store: full custom homepage built (hero, categories, features, newsletter) |
| ✅ | Auto store: Astra branding applied (dark steel/burnt orange palette, Oswald+Barlow fonts) |
| ✅ | Both stores: 3-column footer with widgets (About, Quick Links, Contact+Payment trust badges) |
| ✅ | Both stores: About pages rewritten (professional, no internal metrics leaked) |
| ✅ | Both stores: FAQ pages expanded to 12+ questions with styled layout |
| ✅ | Both stores: Yoast SEO configured (meta titles, breadcrumbs, noindex utility pages) |
| ✅ | Both stores: Shipping Information pages styled with delivery table |
| ✅ | Both stores: Contact pages styled with info cards + CF7 form |
| ✅ | Both stores: Privacy Policy rewritten (AU Privacy Act compliant) |
| ✅ | Both stores: Refund & Returns Policy rewritten (professional) |
| ✅ | Both stores: WooCommerce email sender name/address configured |
| ✅ | Both stores: Branded email subjects for new/processing/completed orders |
| ✅ | Both stores: WP Super Cache enabled (WooCommerce pages excluded) |
| ✅ | Both stores: Google Fonts loading via custom CSS (forced via custom_css post) |
| ✅ | Both stores: WooCommerce shop sidebar (search + price filter + tags) |
| ✅ | Both stores: Home added to primary navigation |
| ✅ | Both stores: Footer navigation menu populated |
| ✅ | Both stores: Permalinks flushed |
| ✅ | Both stores: 6 products seeded via Claude API (seed_products.py) |
| ✅ | Apache Authorization header bug diagnosed and fixed (MU plugin) |
| ✅ | wp-config.php permission bug documented |
| ✅ | All Python scripts updated to use ?rest_route= API URL fallback |
| ✅ | api_url() helper added to _common/db.py |

---

## Key Files Reference

| File | Purpose |
|------|---------|
| `config.json` | Master config — all credentials |
| `seed_products.py` | One-time product seeder using Claude API |
| `_common/scout.py` | Daily AI product research agent (browser-use + Claude) |
| `_common/hype.py` | Social media content generator |
| `_common/sync.sh` | Git + rsync deployment to FastComet |
| `_common/report.py` | Daily CEO Telegram report |
| `_common/db.py` | Shared DB layer + `api_url()` helper for WC REST |
| `master.sh` | Daily orchestrator |
| `STATUS.md` | This file — single source of truth |
| `/var/www/html/pet/wp-content/mu-plugins/api-auth-fix.php` | Critical: fixes WC REST API auth on local HTTP |
| `/var/www/html/auto/wp-content/mu-plugins/api-auth-fix.php` | Same for auto store |

---

## WSL2 Reminder
Services stop on every WSL2 reboot. Always run:
```bash
sudo service apache2 start && sudo service mariadb start
```

After starting services, verify stores are up:
```bash
curl -s http://localhost/pet/ | grep -o "<title>.*</title>"
curl -s http://localhost/auto/ | grep -o "<title>.*</title>"
```
