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
matched (auto.conf alphabetically), so `/pet` URL rewrites only work for `/auto`.

**Workaround:** All API calls use `?rest_route=` fallback (see above). Browser URLs work fine because
the vhost rewrite rules in the `<Directory>` blocks handle the WP routing.

**Permanent fix (requires sudo):** Add WP Directory blocks for both `/pet` and `/auto` to `000-default.conf`.

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
| 1 | MixPost install + API token | PENDING — social posting blocked until done |
| 2 | Test scout.py full run | READY — run `python _common/scout.py pet` |
| 3 | Test report.py (Telegram CEO report) | READY — run `python _common/report.py` |
| 4 | Add real product images | PENDING — products currently have no images |
| 5 | Stripe real API keys (live mode) | DONE ✅ — live keys applied to both stores |
| 6 | FastComet SSH credentials (both stores) | PENDING — needed for live deploy |
| 7 | SSH keys generated + uploaded to FastComet | PENDING |
| 8 | Domain DNS pointed → furlio.au + letsdrive.au | PENDING |
| 9 | Run sync.sh to deploy both stores live | PENDING — after steps 6-8 done |

---

## COMPLETED — This Session (2026-04-19)

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
