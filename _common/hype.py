#!/usr/bin/env python3
"""
Marketing & Hype Agent
Generates 3 social variants per product (TikTok, Instagram, Pinterest)
and schedules them via Mixpost API at peak Australian times.
"""
import json
import logging
import re
import sys
from datetime import date, datetime
from pathlib import Path
from zoneinfo import ZoneInfo

import anthropic
import httpx

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "_common"))
from db import get_conn, get_todays_products, insert_social_post

with open(ROOT / "config.json") as f:
    CFG = json.load(f)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [HYPE] %(levelname)s %(message)s",
    handlers=[
        logging.FileHandler(ROOT / "logs" / f"hype_{date.today()}.log"),
        logging.StreamHandler(),
    ],
)
log = logging.getLogger("hype")

claude = anthropic.Anthropic(api_key=CFG["claude"]["api_key"])
MODEL = CFG["claude"]["model"]
AEST = ZoneInfo("Australia/Sydney")


# ── Content Generator ─────────────────────────────────────────────────────────
def generate_social_variants(product: dict, niche_cfg: dict) -> dict:
    """Generate TikTok script, Instagram caption, Pinterest pin for a product."""
    brand_voice = niche_cfg["brand_voice"]
    store_name = niche_cfg["store_name"]
    domain = niche_cfg["domain"]
    social = niche_cfg["social_media"]

    prompt = f"""You are a viral social media content creator for {store_name} ({domain}).

Brand Voice: {brand_voice}

Product:
- Title: {product['title']}
- Price: ${product['sale_price']} AUD
- Key Description: {product['description'][:300]}...

Create 3 social media posts. Return ONLY valid JSON with these exact keys:

{{
  "tiktok": {{
    "hook": "First 3 seconds hook line (make it stop-scroll worthy)",
    "script": "Full TikTok script (60-90 seconds read time). Include: hook, problem, reveal product, 3 benefits, social proof, CTA. Use conversational Aussie tone with emojis. Format as a proper script with [ACTION] cues.",
    "hashtags": ["#hashtag1", "#hashtag2", "#hashtag3", "#hashtag4", "#hashtag5", "#hashtag6", "#hashtag7"],
    "caption": "TikTok caption (150 chars max) with key hashtags"
  }},
  "instagram": {{
    "caption": "Instagram caption (2200 chars max). Start with a hook line, then value-packed content, break into short paragraphs, end with CTA. Include 5 relevant emojis naturally. No hashtags in caption body.",
    "hashtags": "#tag1 #tag2 #tag3 #tag4 #tag5 #tag6 #tag7 #tag8 #tag9 #tag10 #tag11 #tag12 #tag13 #tag14 #tag15 #tag16 #tag17 #tag18 #tag19 #tag20",
    "alt_text": "Image alt text for accessibility (125 chars)"
  }},
  "pinterest": {{
    "title": "Pinterest pin title (100 chars max, keyword-rich)",
    "description": "Pinterest pin description (500 chars max). Keyword-rich, include price, benefit-led, end with link prompt.",
    "board": "{social.get('pinterest_board', 'Products')}",
    "link": "https://{domain}"
  }}
}}
"""

    response = claude.messages.create(
        model=MODEL,
        max_tokens=3000,
        messages=[{"role": "user", "content": prompt}],
    )

    raw = response.content[0].text.strip()
    raw = re.sub(r'^```json?\s*', '', raw)
    raw = re.sub(r'\s*```$', '', raw)
    return json.loads(raw)


# ── Mixpost Scheduler ─────────────────────────────────────────────────────────
class MixpostClient:
    def __init__(self):
        self.base_url = CFG["mixpost"]["base_url"].rstrip("/")
        self.token = CFG["mixpost"]["api_token"]
        self.headers = {
            "Authorization": f"Bearer {self.token}",
            "Accept": "application/json",
            "Content-Type": "application/json",
        }

    def _post(self, endpoint: str, data: dict) -> dict:
        resp = httpx.post(
            f"{self.base_url}/{endpoint}",
            headers=self.headers,
            json=data,
            timeout=15,
        )
        resp.raise_for_status()
        return resp.json()

    def get_accounts(self) -> list:
        resp = httpx.get(f"{self.base_url}/accounts", headers=self.headers, timeout=10)
        resp.raise_for_status()
        return resp.json().get("data", [])

    def schedule_post(self, account_ids: list, content: str, scheduled_at: str,
                      image_ids: list = None) -> dict:
        payload = {
            "accounts": account_ids,
            "versions": [{"account_id": aid, "content": [{"body": content}]} for aid in account_ids],
            "scheduled_at": scheduled_at,
            "status": "scheduled",
        }
        if image_ids:
            for v in payload["versions"]:
                v["content"][0]["media"] = [{"id": mid} for mid in image_ids]
        return self._post("posts", payload)


def get_next_peak_slot(platform_index: int) -> str:
    """Return an AEST peak time for today/tomorrow as ISO-8601 string."""
    peak_times = CFG["mixpost"]["peak_times_aest"]
    time_str = peak_times[platform_index % len(peak_times)]
    hour, minute = map(int, time_str.split(":"))
    now = datetime.now(AEST)
    slot = now.replace(hour=hour, minute=minute, second=0, microsecond=0)
    if slot <= now:
        # Push to tomorrow
        from datetime import timedelta
        slot += timedelta(days=1)
    return slot.strftime("%Y-%m-%d %H:%M:%S")


def get_account_ids_for_niche(mixpost: MixpostClient, niche_cfg: dict) -> dict:
    """Map platform names to Mixpost account IDs by matching account names."""
    accounts = mixpost.get_accounts()
    mapping = {}
    social = niche_cfg["social_media"]
    name_map = {
        "tiktok": social.get("tiktok_account", "").lstrip("@").lower(),
        "instagram": social.get("instagram_account", "").lstrip("@").lower(),
        "pinterest": social.get("pinterest_board", "").lower(),
    }
    for acc in accounts:
        username = acc.get("username", "").lower()
        name = acc.get("name", "").lower()
        for platform, search_name in name_map.items():
            if search_name and (search_name in username or search_name in name):
                mapping[platform] = acc["id"]
    return mapping


# ── Main Orchestrator ─────────────────────────────────────────────────────────
def run_hype(niche_key: str):
    niche_cfg = CFG["niches"][niche_key]
    if not niche_cfg.get("enabled", True):
        log.info(f"Niche '{niche_key}' disabled — skipping.")
        return

    log.info(f"=== Starting Hype for: {niche_cfg['store_name']} ===")
    conn = get_conn(CFG["global"]["db_path"])
    mixpost = MixpostClient()

    products = get_todays_products(conn, niche_key)
    if not products:
        log.warning(f"No products found today for {niche_key}.")
        return

    try:
        account_map = get_account_ids_for_niche(mixpost, niche_cfg)
        log.info(f"Mixpost accounts found: {account_map}")
    except Exception as e:
        log.error(f"Could not fetch Mixpost accounts: {e}")
        account_map = {}

    total_scheduled = 0
    platforms = ["tiktok", "instagram", "pinterest"]

    for idx, product in enumerate(products):
        product = dict(product)
        log.info(f"Generating social content for: {product['title']}")

        try:
            variants = generate_social_variants(product, niche_cfg)
        except Exception as e:
            log.error(f"Content generation failed for product {product['id']}: {e}")
            continue

        for p_idx, platform in enumerate(platforms):
            slot_index = (idx * len(platforms)) + p_idx
            scheduled_at = get_next_peak_slot(slot_index)

            if platform == "tiktok":
                content = f"{variants['tiktok']['hook']}\n\n{variants['tiktok']['script']}\n\n{variants['tiktok']['caption']}"
            elif platform == "instagram":
                content = f"{variants['instagram']['caption']}\n.\n.\n.\n{variants['instagram']['hashtags']}"
            else:
                content = f"{variants['pinterest']['title']}\n\n{variants['pinterest']['description']}"

            mixpost_id = None
            acc_id = account_map.get(platform)
            if acc_id:
                try:
                    result = mixpost.schedule_post([acc_id], content, scheduled_at)
                    mixpost_id = str(result.get("data", {}).get("id", ""))
                    log.info(f"Scheduled {platform} post at {scheduled_at} (Mixpost ID: {mixpost_id})")
                except Exception as e:
                    log.error(f"Mixpost schedule failed for {platform}: {e}")
            else:
                log.warning(f"No Mixpost account found for {platform} — saving content only")

            insert_social_post(conn, {
                "product_id": product["id"],
                "niche": niche_key,
                "platform": platform,
                "content": content,
                "mixpost_id": mixpost_id or "",
                "scheduled_at": scheduled_at,
                "status": "scheduled" if mixpost_id else "content_ready",
            })
            total_scheduled += 1

        # Save variant JSON locally
        out_dir = Path(niche_cfg["wp_content_path"]) / "ai-content" / str(date.today())
        out_dir.mkdir(parents=True, exist_ok=True)
        safe_title = re.sub(r'[^\w-]', '_', product['title'][:40])
        (out_dir / f"{safe_title}_social.json").write_text(
            json.dumps(variants, indent=2, ensure_ascii=False)
        )

    log.info(f"=== Hype complete for {niche_key}: {total_scheduled} posts scheduled ===")
    conn.close()


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("niche", help="Niche key from config.json (e.g. pet, auto)")
    args = parser.parse_args()

    if args.niche not in CFG["niches"]:
        print(f"Unknown niche '{args.niche}'. Available: {list(CFG['niches'].keys())}")
        sys.exit(1)

    run_hype(args.niche)
