#!/usr/bin/env python3
"""
Seed initial products into both WooCommerce stores using Claude API.
Runs without browser scraping — creates realistic sample products for local testing.
Usage: python seed_products.py [pet|auto|both]
"""
import json
import sys
import re
import httpx
import anthropic
from pathlib import Path

ROOT = Path(__file__).resolve().parent
with open(ROOT / "config.json") as f:
    CFG = json.load(f)

claude = anthropic.Anthropic(api_key=CFG["claude"]["api_key"])
MODEL = CFG["claude"]["model"]


def _api_url(base_url: str, route: str) -> str:
    """Use ?rest_route= fallback to avoid Apache rewrite dependency on local."""
    return f"{base_url}/index.php?rest_route={route}"


def get_categories(base_url: str, ck: str, cs: str) -> dict:
    resp = httpx.get(_api_url(base_url, "/wc/v3/products/categories"),
                     auth=(ck, cs), timeout=15)
    resp.raise_for_status()
    return {c["name"]: c["id"] for c in resp.json() if c["name"] != "Uncategorized"}


def generate_products(niche_cfg: dict, count: int = 5) -> list[dict]:
    cats = niche_cfg["categories"]
    keywords = ", ".join(niche_cfg["target_keywords"][:3])
    brand_voice = niche_cfg["brand_voice"]
    store = niche_cfg["store_name"]
    min_p = niche_cfg["min_price_aud"]
    max_p = niche_cfg["max_price_aud"]
    target_margin = niche_cfg["target_margin_pct"]

    prompt = f"""You are a product copywriter for {store}, an Australian dropshipping store.

Brand Voice: {brand_voice}
Categories: {', '.join(cats)}
Target Keywords: {keywords}
Price Range: ${min_p}–${max_p} AUD
Target Margin: {target_margin}%

Generate {count} realistic, specific dropshipping products that would sell well in Australia.
Each product must be a real type of product (not generic), have a supplier price that allows
a {target_margin}% margin when sold in the ${min_p}–${max_p} AUD range.

Return ONLY a JSON array with exactly these fields per product:
[
  {{
    "name": "SEO product name (60 chars max, include keyword)",
    "category": "one of the categories listed above",
    "supplier_price_aud": 15.00,
    "regular_price": "49.95",
    "description": "High-converting WooCommerce description (250-350 words). Use HTML: <h3>, <ul>, <li>, <strong>. Include: hook, 4-5 bullet benefits, Aussie appeal, urgency CTA.",
    "short_description": "2-sentence punchy excerpt.",
    "sku": "UNIQUE-SKU-CODE",
    "tags": ["tag1", "tag2", "tag3"],
    "meta_title": "SEO title 60 chars",
    "meta_desc": "SEO meta description 155 chars"
  }}
]

Only return valid JSON array. No markdown fences."""

    resp = claude.messages.create(
        model=MODEL,
        max_tokens=8000,
        messages=[{"role": "user", "content": prompt}],
    )
    raw = resp.content[0].text.strip()
    raw = re.sub(r'^```json?\s*', '', raw)
    raw = re.sub(r'\s*```$', '', raw)
    return json.loads(raw)


def publish_product(product: dict, categories: dict, base_url: str, ck: str, cs: str) -> int | None:
    cat_id = categories.get(product["category"])
    payload = {
        "name": product["name"],
        "type": "simple",
        "status": "publish",
        "description": product["description"],
        "short_description": product["short_description"],
        "regular_price": str(product["regular_price"]),
        "sku": product.get("sku", ""),
        "categories": [{"id": cat_id}] if cat_id else [],
        "tags": [{"name": t} for t in product.get("tags", [])],
        "meta_data": [
            {"key": "_yoast_wpseo_title", "value": product.get("meta_title", "")},
            {"key": "_yoast_wpseo_metadesc", "value": product.get("meta_desc", "")},
        ],
    }
    try:
        resp = httpx.post(_api_url(base_url, "/wc/v3/products"),
                          auth=(ck, cs), json=payload, timeout=30)
        resp.raise_for_status()
        wid = resp.json().get("id")
        print(f"  Published: {product['name']} → WooCommerce ID {wid} @ ${product['regular_price']}")
        return wid
    except Exception as e:
        print(f"  FAILED: {product['name']} — {e}")
        if hasattr(e, 'response'):
            print(f"  Response: {e.response.text[:300]}")
        return None


def seed_niche(niche_key: str, count: int = 5):
    niche = CFG["niches"][niche_key]
    base_url = niche["wp_url_local"]
    ck = niche["woocommerce_consumer_key"]
    cs = niche["woocommerce_consumer_secret"]

    print(f"\n{'='*60}")
    print(f"Seeding: {niche['store_name']} ({count} products)")
    print(f"{'='*60}")

    print("Fetching categories...")
    try:
        categories = get_categories(base_url, ck, cs)
        print(f"Categories: {list(categories.keys())}")
    except Exception as e:
        print(f"ERROR fetching categories: {e}")
        return

    print(f"Generating {count} products with Claude...")
    try:
        products = generate_products(niche, count)
        print(f"Generated {len(products)} products")
    except Exception as e:
        print(f"ERROR generating products: {e}")
        return

    published = 0
    for p in products:
        wid = publish_product(p, categories, base_url, ck, cs)
        if wid:
            published += 1

    print(f"\nDone: {published}/{len(products)} products published to {niche['store_name']}")


if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "both"

    if target in ("pet", "both"):
        seed_niche("pet", count=6)
    if target in ("auto", "both"):
        seed_niche("auto", count=6)
    if target not in ("pet", "auto", "both"):
        print(f"Usage: python seed_products.py [pet|auto|both]")
        sys.exit(1)
