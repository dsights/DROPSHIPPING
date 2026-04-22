# New Store Prompt — Add a New Niche to the Empire

Use this prompt when you want to add a brand new dropshipping store (niche) that follows the same infrastructure as pet and auto, but customized for the new business.

---

## PROMPT (copy-paste to Claude, fill in the CAPS fields)

```
I want to add a new dropshipping niche to my existing Autonomous Dropshipping Empire.

PROJECT: /home/dsights/claude/DROPSHIPPING
EXISTING NICHES: pet (/var/www/html/pet), auto (/var/www/html/auto)
STACK: Apache2 + PHP 8.3 + MariaDB + WordPress + WooCommerce (WSL2)

NEW NICHE DETAILS:
- Niche key (short slug, e.g. "fitness"):        NICHE_SLUG
- Store name (e.g. "FitGear Australia"):          STORE_NAME
- Domain (live, e.g. "fitgear.com.au"):           DOMAIN
- Brand voice (tone, phrases, audience):          BRAND_VOICE
- Product categories (comma-separated):           CATEGORIES
- Target keywords (comma-separated):              KEYWORDS
- Min price AUD:                                  MIN_PRICE
- Max price AUD:                                  MAX_PRICE
- TikTok handle:                                  TIKTOK
- Instagram handle:                               INSTAGRAM
- Pinterest board:                                PINTEREST

WHAT NEEDS TO BE DONE (follow this order):
1. Create MariaDB database:
   - DB name: wp_NICHE_SLUG
   - Grant access to wpuser@localhost (password: WpLocal2024!)
   - mysql -u root -pRoot@1234

2. Download + install WordPress at /var/www/html/NICHE_SLUG
   - Use WP-CLI
   - DB: wp_NICHE_SLUG, dbuser: wpuser, dbpass: WpLocal2024!
   - URL: http://localhost/NICHE_SLUG
   - Admin: admin / Admin@Local2024!
   - Admin email: dsightstech@gmail.com
   - Locale: en_AU, currency: AUD

3. Install & activate all standard plugins:
   woocommerce, wordpress-seo, woo-variation-swatches,
   mailchimp-for-woocommerce, really-simple-ssl, wp-super-cache, contact-form-7

4. Configure WooCommerce:
   - Store address: 1 Collins Street, Melbourne VIC 3000 AU
   - Currency: AUD, weight: kg, dimensions: cm
   - Enable REST API
   - Create AU shipping zone
   - Set permalink to /%postname%/
   - Create the product categories listed above

5. Create Apache vhost at /etc/apache2/sites-available/NICHE_SLUG.conf
   - Follow the same pattern as /etc/apache2/sites-available/pet.conf
   - Alias /NICHE_SLUG to /var/www/html/NICHE_SLUG
   - Enable with a2ensite and restart apache2

6. Set file permissions:
   sudo chown -R dsights:www-data /var/www/html/NICHE_SLUG
   sudo chmod -R 775 /var/www/html/NICHE_SLUG
   sudo chmod 640 /var/www/html/NICHE_SLUG/wp-config.php

7. Generate WooCommerce REST API keys and WordPress App Password
   (run post_install logic for this niche only)

8. Add new niche block to config.json under "niches":
   Follow the exact same structure as the "pet" or "auto" entry,
   customized with the details above.
   Paths: local_wp_path=/var/www/html/NICHE_SLUG
   wp_url_local=http://localhost/NICHE_SLUG

9. Add supplier_urls and trending_sources relevant to the new niche.

10. Initialize git repo in /var/www/html/NICHE_SLUG

KNOWN QUIRKS TO FOLLOW:
- Write sudo commands to a .sh file and ask me to run them
- Use mysql -u root -pRoot@1234 (not sudo mysql)
- WP-CLI runs as dsights user — wp-config.php must be owned by dsights
- No ! in passwords (use # or escape with \!)
- Paste commands one at a time or as a .sh file to avoid line-break errors

When done, the new store should be accessible at http://localhost/NICHE_SLUG
and master.sh should automatically include it (reads enabled niches from config.json).
```

---

## After adding a new store, also do:
- Add FastComet SSH credentials for the new niche in config.json
- Generate SSH key: `ssh-keygen -t rsa -b 4096 -f ~/.ssh/fastcomet_NICHE_SLUG_rsa -N ""`
- Upload public key to FastComet SSH Manager
- Test: `venv/bin/python3 _common/scout.py NICHE_SLUG`
