#!/usr/bin/env python3
"""
Product Image Seeder
Fetches relevant free images from loremflickr.com and attaches them to WooCommerce products.
Uses Claude API to extract optimal search keywords from product names.

Usage: python add_product_images.py [pet|auto|both]
"""
import json
import sys
import time
import tempfile
from pathlib import Path

import httpx
import anthropic

ROOT = Path(__file__).resolve().parent
with open(ROOT / "config.json") as f:
    CFG = json.load(f)

claude = anthropic.Anthropic(api_key=CFG["claude"]["api_key"])
MODEL = CFG["claude"]["model"]

IMAGE_W, IMAGE_H = 800, 600
LOREMFLICKR = "https://loremflickr.com/{w}/{h}/{keywords}"


def api_url(base_url: str, route: str) -> str:
    return f"{base_url}/index.php?rest_route={route}"


def get_keywords_for_products(products: list[dict]) -> dict[int, str]:
    """Use Claude to extract 2-3 precise image search keywords per product."""
    names = [f'ID {p["id"]}: {p["name"]}' for p in products]
    prompt = f"""For each product below, return 2-3 comma-separated English keywords
suitable for a free stock photo search. Keywords should describe the physical object
clearly (e.g. "dog bed,pet sleep" not "Australia,free shipping").

Return ONLY a JSON object mapping product ID (integer) to keyword string.
Example: {{"41": "dog bed,memory foam", "42": "cat toy,feather wand"}}

Products:
{chr(10).join(names)}"""

    resp = claude.messages.create(
        model=MODEL,
        max_tokens=500,
        messages=[{"role": "user", "content": prompt}],
    )
    raw = resp.content[0].text.strip()
    # Strip markdown fences if present
    if raw.startswith("```"):
        raw = raw.split("```")[1]
        if raw.startswith("json"):
            raw = raw[4:]
    result = json.loads(raw.strip())
    # Normalise keys to int
    return {int(k): v for k, v in result.items()}


def fetch_image_bytes(keywords: str) -> bytes | None:
    """Download image from loremflickr.com matching keywords."""
    # Replace spaces with commas, strip extras
    kw = keywords.strip().replace(" ", ",").replace(",,", ",")
    url = LOREMFLICKR.format(w=IMAGE_W, h=IMAGE_H, keywords=kw)
    try:
        resp = httpx.get(url, follow_redirects=True, timeout=20)
        if resp.status_code == 200 and resp.headers.get("content-type", "").startswith("image/"):
            return resp.content
        print(f"    loremflickr returned {resp.status_code} for '{kw}'")
        return None
    except Exception as e:
        print(f"    Image fetch failed: {e}")
        return None


def upload_image_to_wp(
    image_bytes: bytes,
    filename: str,
    base_url: str,
    wp_user: str,
    wp_pass: str,
) -> int | None:
    """Upload image to WordPress media library, return attachment ID."""
    url = api_url(base_url, "/wp/v2/media")
    headers = {
        "Content-Disposition": f'attachment; filename="{filename}"',
        "Content-Type": "image/jpeg",
    }
    try:
        resp = httpx.post(
            url,
            content=image_bytes,
            headers=headers,
            auth=(wp_user, wp_pass),
            timeout=30,
        )
        if resp.status_code in (200, 201):
            media_id = resp.json().get("id")
            print(f"    Uploaded to media library: ID {media_id}")
            return media_id
        print(f"    Media upload failed: {resp.status_code} — {resp.text[:200]}")
        return None
    except Exception as e:
        print(f"    Media upload exception: {e}")
        return None


def set_product_image(
    product_id: int,
    media_id: int,
    base_url: str,
    ck: str,
    cs: str,
) -> bool:
    """Set image on WooCommerce product."""
    url = api_url(base_url, f"/wc/v3/products/{product_id}")
    try:
        resp = httpx.put(
            url,
            auth=(ck, cs),
            json={"images": [{"id": media_id}]},
            timeout=20,
        )
        return resp.status_code in (200, 201)
    except Exception as e:
        print(f"    Product image set failed: {e}")
        return False


def process_store(niche_key: str):
    niche = CFG["niches"][niche_key]
    base_url = niche["wp_url_local"]
    ck = niche["woocommerce_consumer_key"]
    cs = niche["woocommerce_consumer_secret"]
    wp_user = niche["wp_user"]
    wp_pass = niche["wp_app_password"]
    store = niche["store_name"]

    print(f"\n{'='*60}")
    print(f"Adding images: {store}")
    print(f"{'='*60}")

    # Get all published products without images
    try:
        resp = httpx.get(
            f"{base_url}/index.php",
            auth=(ck, cs),
            params={"rest_route": "/wc/v3/products", "per_page": 100, "status": "publish"},
            timeout=15,
        )
        resp.raise_for_status()
        all_products = resp.json()
    except Exception as e:
        print(f"ERROR fetching products: {e}")
        return

    # Filter to products without images
    products = [p for p in all_products if not p.get("images")]
    if not products:
        print("All products already have images.")
        return

    print(f"Found {len(products)} products needing images")

    # Get keywords for all products in one Claude call
    print("Generating search keywords via Claude...")
    try:
        keyword_map = get_keywords_for_products(products)
    except Exception as e:
        print(f"ERROR getting keywords: {e}")
        # Fallback: use first words of product name
        keyword_map = {}
        for p in products:
            words = p["name"].split()[:3]
            keyword_map[p["id"]] = ",".join(words).lower()

    print(f"Keywords: {keyword_map}")

    success = 0
    for product in products:
        pid = product["id"]
        name = product["name"]
        keywords = keyword_map.get(pid, name.split()[0])

        print(f"\n  [{pid}] {name[:55]}")
        print(f"    Keywords: {keywords}")

        # Fetch image
        image_bytes = fetch_image_bytes(keywords)
        if not image_bytes:
            print("    SKIP — could not fetch image")
            continue

        # Upload to WP media library
        filename = f"product-{niche_key}-{pid}.jpg"
        media_id = upload_image_to_wp(image_bytes, filename, base_url, wp_user, wp_pass)
        if not media_id:
            print("    SKIP — media upload failed")
            continue

        # Attach to product
        ok = set_product_image(pid, media_id, base_url, ck, cs)
        if ok:
            print(f"    ✅ Image attached to product {pid}")
            success += 1
        else:
            print(f"    ❌ Failed to attach image to product {pid}")

        # Small delay to avoid hammering loremflickr
        time.sleep(1)

    print(f"\nDone: {success}/{len(products)} products now have images on {store}")


if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "both"

    if target in ("pet", "both"):
        process_store("pet")
    if target in ("auto", "both"):
        process_store("auto")
    if target not in ("pet", "auto", "both"):
        print("Usage: python add_product_images.py [pet|auto|both]")
        sys.exit(1)
