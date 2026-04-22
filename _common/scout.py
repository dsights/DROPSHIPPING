#!/usr/bin/env python3
"""
Scout & Merchant Agent
Finds trending products, validates margins, writes WooCommerce listings + SEO blogs.
Uses browser-use + Claude API for fully autonomous operation.
"""
import asyncio
import json
import logging
import re
import sys
import httpx
from datetime import datetime, date
from pathlib import Path
from typing import Optional

import anthropic
from browser_use import Agent as BrowserAgent
from browser_use.browser.session import BrowserSession
from browser_use.browser.profile import BrowserProfile
from browser_use.llm import ChatAnthropic

# ── Path bootstrap ──────────────────────────────────────────────────────────
ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "_common"))
from db import get_conn, insert_product, update_product_status, get_todays_products, get_wp_url, api_url

# ── Config ───────────────────────────────────────────────────────────────────
with open(ROOT / "config.json") as f:
    CFG = json.load(f)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [SCOUT] %(levelname)s %(message)s",
    handlers=[
        logging.FileHandler(ROOT / "logs" / f"scout_{date.today()}.log"),
        logging.StreamHandler(),
    ],
)
log = logging.getLogger("scout")

# Direct Anthropic client for content generation
claude = anthropic.Anthropic(api_key=CFG["claude"]["api_key"])
# browser-use native LLM wrapper
claude_lc = ChatAnthropic(model=CFG["claude"]["model"], api_key=CFG["claude"]["api_key"])
MODEL = CFG["claude"]["model"]
MAX_PRODUCTS_PER_RUN = 5


# ── Margin Calculator ────────────────────────────────────────────────────────
def calc_margin(supplier_price_aud: float, sale_price_aud: float) -> float:
    if sale_price_aud <= 0:
        return 0.0
    return ((sale_price_aud - supplier_price_aud) / sale_price_aud) * 100


def suggested_sale_price(supplier_price_aud: float, target_margin: float) -> float:
    """Back-calculate a sale price that hits the target margin."""
    return round(supplier_price_aud / (1 - target_margin / 100), 2)


# ── Browser Scout ─────────────────────────────────────────────────────────────
async def scout_products_browser(niche_cfg: dict) -> list[dict]:
    """Use browser-use to scrape trending products from supplier/marketplace URLs."""
    target_margin = niche_cfg.get("target_margin_pct", CFG["global"]["target_margin_pct"])
    min_price = niche_cfg.get("min_price_aud", 15)
    max_price = niche_cfg.get("max_price_aud", 300)

    task_prompt = f"""
You are a professional product researcher for an Australian dropshipping store called "{niche_cfg['store_name']}".

Visit these trending product pages one by one and find {MAX_PRODUCTS_PER_RUN} products that:
1. Are trending/bestselling in Australia
2. Have a supplier price that allows a {target_margin}% margin when sold between ${min_price} and ${max_price} AUD
3. Offer Australian local shipping OR fast international shipping (under 7 days)
4. Are NOT counterfeit or brand-name replicas

Pages to visit (in order):
{chr(10).join(f'- {url}' for url in niche_cfg['trending_sources'])}

For each qualifying product, extract:
- product_title: exact product name
- supplier_url: URL of the product page
- supplier_price_aud: estimated AUD price (convert if needed, 1 USD ≈ 1.55 AUD)
- image_url: main product image URL
- key_features: bullet list of 3-5 key features
- shipping_info: shipping method and estimated days

Return your findings as a JSON array. Only return the JSON, nothing else.
Example format:
[
  {{
    "product_title": "...",
    "supplier_url": "...",
    "supplier_price_aud": 12.50,
    "image_url": "...",
    "key_features": ["Feature 1", "Feature 2"],
    "shipping_info": "AU Warehouse, 3-5 days"
  }}
]
"""

    profile = BrowserProfile(headless=True, disable_security=False)
    browser = BrowserSession(browser_profile=profile)

    try:
        agent = BrowserAgent(
            task=task_prompt,
            llm=claude_lc,
            browser=browser,
        )
        result = await agent.run(max_steps=40)
        raw = result.final_result() or "[]"

        # Extract JSON from result
        json_match = re.search(r'\[.*\]', raw, re.DOTALL)
        if json_match:
            products = json.loads(json_match.group())
            log.info(f"Browser scout found {len(products)} raw products for {niche_cfg['store_name']}")
            return products
        return []
    except Exception as e:
        log.error(f"Browser scout failed: {e}")
        return []
    finally:
        await browser.stop()


# ── Content Generator ─────────────────────────────────────────────────────────
def generate_product_content(product: dict, niche_cfg: dict) -> dict:
    """Use Claude to write a WooCommerce listing + 1000-word SEO blog post."""
    brand_voice = niche_cfg["brand_voice"]
    store_name = niche_cfg["store_name"]
    keywords = ", ".join(niche_cfg.get("target_keywords", [])[:4])
    sale_price = suggested_sale_price(
        product["supplier_price_aud"],
        niche_cfg.get("target_margin_pct", 55)
    )

    prompt = f"""You are a high-converting copywriter and SEO expert for {store_name}, an Australian dropshipping store.

Brand Voice: {brand_voice}

Product Details:
- Title: {product['product_title']}
- Key Features: {json.dumps(product.get('key_features', []))}
- Supplier Price (AUD): ${product['supplier_price_aud']}
- Sale Price (AUD): ${sale_price}
- Shipping: {product.get('shipping_info', 'Fast AU delivery')}
- Target Keywords: {keywords}

Generate a JSON response with EXACTLY these keys:

{{
  "seo_title": "SEO-optimised product title (60 chars max, include primary keyword)",
  "woo_description": "High-converting WooCommerce product description (300-400 words). Include: hook, key benefits as bullet points, social proof language, Aussie-specific appeal, urgency CTA. Use HTML formatting (<h3>, <ul>, <li>, <strong>).",
  "woo_short_description": "2-3 sentence short description for WooCommerce excerpt. Punchy and benefit-led.",
  "meta_description": "SEO meta description (155 chars max)",
  "blog_post": "A 1000-word SEO blog post in markdown format. Structure: engaging title (H1), intro (hook + keyword), 3-4 H2 sections covering use cases, why Aussies love it, buying guide tips, and a conclusion with CTA linking to the product. Naturally include the target keywords 3-4 times.",
  "blog_title": "Compelling blog post title with primary keyword",
  "blog_slug": "url-friendly-blog-slug",
  "tags": ["tag1", "tag2", "tag3", "tag4", "tag5"]
}}

Only return valid JSON. No markdown code fences.
"""

    response = claude.messages.create(
        model=MODEL,
        max_tokens=CFG["claude"]["max_tokens"],
        messages=[{"role": "user", "content": prompt}],
    )

    raw = response.content[0].text.strip()
    # Strip code fences if present
    raw = re.sub(r'^```json?\s*', '', raw)
    raw = re.sub(r'\s*```$', '', raw)

    content = json.loads(raw)
    content["sale_price"] = sale_price
    content["supplier_price_aud"] = product["supplier_price_aud"]
    content["margin_pct"] = calc_margin(product["supplier_price_aud"], sale_price)
    return content


# ── WooCommerce Publisher ─────────────────────────────────────────────────────
def publish_to_woocommerce(product: dict, content: dict, niche_cfg: dict) -> Optional[int]:
    """Push product to WooCommerce REST API."""
    base_url = get_wp_url(niche_cfg, CFG["global"])
    ck = niche_cfg["woocommerce_consumer_key"]
    cs = niche_cfg["woocommerce_consumer_secret"]

    payload = {
        "name": content["seo_title"],
        "type": "simple",
        "status": "publish",
        "description": content["woo_description"],
        "short_description": content["woo_short_description"],
        "regular_price": str(content["sale_price"]),
        "categories": [{"name": niche_cfg["categories"][0]}],
        "tags": [{"name": t} for t in content.get("tags", [])],
        "meta_data": [
            {"key": "_yoast_wpseo_title", "value": content["seo_title"]},
            {"key": "_yoast_wpseo_metadesc", "value": content["meta_description"]},
        ],
    }

    if product.get("image_url"):
        payload["images"] = [{"src": product["image_url"], "position": 0}]

    try:
        resp = httpx.post(
            api_url(base_url, "/wc/v3/products"),
            auth=(ck, cs),
            json=payload,
            timeout=30,
        )
        resp.raise_for_status()
        woo_id = resp.json().get("id")
        log.info(f"Published product to WooCommerce: ID {woo_id}")
        return woo_id
    except Exception as e:
        log.error(f"WooCommerce publish failed: {e}")
        return None


def publish_blog_post(content: dict, niche_cfg: dict, woo_product_id: Optional[int]) -> Optional[int]:
    """Push blog post to WordPress REST API."""
    base_url = get_wp_url(niche_cfg, CFG["global"])
    # Use WP Application Password (user:app_password in niche config)
    wp_user = niche_cfg.get("wp_user", "admin")
    wp_app_pass = niche_cfg.get("wp_app_password", "")

    cta_link = ""
    if woo_product_id:
        cta_link = f'\n\n<a href="{base_url}/?p={woo_product_id}" class="wp-block-button__link">Shop Now →</a>'

    blog_html = content["blog_post"].replace("\n", "<br>") + cta_link

    payload = {
        "title": content["blog_title"],
        "content": blog_html,
        "slug": content["blog_slug"],
        "status": "publish",
        "excerpt": content["meta_description"],
    }

    try:
        resp = httpx.post(
            api_url(base_url, "/wp/v2/posts"),
            auth=(wp_user, wp_app_pass),
            json=payload,
            timeout=30,
        )
        resp.raise_for_status()
        post_id = resp.json().get("id")
        log.info(f"Published blog post: ID {post_id}")
        return post_id
    except Exception as e:
        log.error(f"Blog post publish failed: {e}")
        return None


def save_local_assets(content: dict, niche_cfg: dict, product_id: int):
    """Save blog markdown + product JSON to local wp-content folder."""
    out_dir = Path(niche_cfg["wp_content_path"]) / "ai-content" / str(date.today())
    out_dir.mkdir(parents=True, exist_ok=True)

    slug = content.get("blog_slug", f"product-{product_id}")
    (out_dir / f"{slug}.md").write_text(content["blog_post"], encoding="utf-8")
    (out_dir / f"{slug}_product.json").write_text(
        json.dumps(content, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    log.info(f"Saved local assets to {out_dir}/{slug}")


# ── Main Orchestrator ─────────────────────────────────────────────────────────
async def run_scout(niche_key: str):
    niche_cfg = CFG["niches"][niche_key]
    if not niche_cfg.get("enabled", True):
        log.info(f"Niche '{niche_key}' disabled — skipping.")
        return

    log.info(f"=== Starting Scout for: {niche_cfg['store_name']} ===")
    conn = get_conn(CFG["global"]["db_path"])

    # Check if we already processed enough products today
    existing = get_todays_products(conn, niche_key)
    if len(existing) >= MAX_PRODUCTS_PER_RUN:
        log.info(f"Already have {len(existing)} products today for {niche_key} — skipping scout.")
        return

    # Phase 1: Scout products via browser
    raw_products = await scout_products_browser(niche_cfg)
    if not raw_products:
        log.warning("No products found by browser scout. Exiting.")
        return

    processed = 0
    for product in raw_products[:MAX_PRODUCTS_PER_RUN]:
        try:
            # Validate margin
            sale_price = suggested_sale_price(
                product["supplier_price_aud"],
                niche_cfg.get("target_margin_pct", 55)
            )
            margin = calc_margin(product["supplier_price_aud"], sale_price)
            if margin < niche_cfg.get("target_margin_pct", 55):
                log.info(f"Skipping '{product['product_title']}' — margin {margin:.1f}% below target")
                continue

            log.info(f"Processing: {product['product_title']} (margin: {margin:.1f}%)")

            # Phase 2: Generate content
            content = generate_product_content(product, niche_cfg)

            # Phase 3: Save to DB first
            db_id = insert_product(conn, niche_key, {
                "supplier_url": product.get("supplier_url", ""),
                "supplier_price": product["supplier_price_aud"],
                "sale_price": content["sale_price"],
                "margin_pct": content["margin_pct"],
                "title": content["seo_title"],
                "description": content["woo_description"],
                "blog_post": content["blog_post"],
                "image_urls": json.dumps([product.get("image_url", "")]),
                "status": "pending",
            })

            # Phase 4: Save local assets
            save_local_assets(content, niche_cfg, db_id)

            # Phase 5: Publish to WooCommerce
            woo_product_id = publish_to_woocommerce(product, content, niche_cfg)
            woo_post_id = publish_blog_post(content, niche_cfg, woo_product_id)

            status = "published" if woo_product_id else "local_only"
            update_product_status(conn, db_id, status, woo_product_id, woo_post_id)

            processed += 1
            log.info(f"Done: {content['seo_title']} [{status}]")

        except Exception as e:
            log.error(f"Failed processing product '{product.get('product_title')}': {e}", exc_info=True)
            continue

    log.info(f"=== Scout complete for {niche_key}: {processed} products processed ===")
    conn.close()


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("niche", help="Niche key from config.json (e.g. pet, auto)")
    args = parser.parse_args()

    if args.niche not in CFG["niches"]:
        print(f"Unknown niche '{args.niche}'. Available: {list(CFG['niches'].keys())}")
        sys.exit(1)

    asyncio.run(run_scout(args.niche))
