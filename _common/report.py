#!/usr/bin/env python3
"""
CEO Daily Report Agent
Aggregates daily performance across all niches and sends via Telegram/WhatsApp.
"""
import json
import logging
import sqlite3
import sys
import urllib.parse
from datetime import date, timedelta
from pathlib import Path

import anthropic
import httpx

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "_common"))
from db import get_conn, get_wp_url, api_url

with open(ROOT / "config.json") as f:
    CFG = json.load(f)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [REPORT] %(levelname)s %(message)s",
    handlers=[
        logging.FileHandler(ROOT / "logs" / f"report_{date.today()}.log"),
        logging.StreamHandler(),
    ],
)
log = logging.getLogger("report")

claude = anthropic.Anthropic(api_key=CFG["claude"]["api_key"])
MODEL = CFG["claude"]["model"]
TODAY = str(date.today())
YESTERDAY = str(date.today() - timedelta(days=1))


# ── WooCommerce Sales Fetcher ─────────────────────────────────────────────────
def fetch_woo_sales(niche_cfg: dict) -> dict:
    base_url = get_wp_url(niche_cfg, CFG["global"])
    ck = niche_cfg["woocommerce_consumer_key"]
    cs = niche_cfg["woocommerce_consumer_secret"]

    try:
        resp = httpx.get(
            api_url(base_url, "/wc/v3/reports/sales"),
            auth=(ck, cs),
            params={
                "date_min": YESTERDAY,
                "date_max": TODAY,
                "period": "custom",
            },
            timeout=15,
        )
        resp.raise_for_status()
        data = resp.json()
        if isinstance(data, list) and data:
            return {
                "total_sales": float(data[0].get("total_sales", 0)),
                "net_revenue": float(data[0].get("net_revenue", 0)),
                "total_orders": int(data[0].get("total_orders", 0)),
                "total_items": int(data[0].get("total_items", 0)),
            }
    except Exception as e:
        log.warning(f"WooCommerce sales fetch failed for {niche_cfg['store_name']}: {e}")

    return {"total_sales": 0, "net_revenue": 0, "total_orders": 0, "total_items": 0}


# ── DB Aggregator ─────────────────────────────────────────────────────────────
def aggregate_niche_stats(conn: sqlite3.Connection, niche: str) -> dict:
    products_added = conn.execute(
        "SELECT COUNT(*) FROM products WHERE niche=? AND created_at=? AND status!='rejected'",
        (niche, TODAY)
    ).fetchone()[0]

    blogs_posted = conn.execute(
        "SELECT COUNT(*) FROM products WHERE niche=? AND created_at=? AND woo_post_id IS NOT NULL",
        (niche, TODAY)
    ).fetchone()[0]

    social_scheduled = conn.execute(
        "SELECT COUNT(*) FROM social_posts WHERE niche=? AND created_at=? AND status='scheduled'",
        (niche, TODAY)
    ).fetchone()[0]

    social_content_ready = conn.execute(
        "SELECT COUNT(*) FROM social_posts WHERE niche=? AND created_at=? AND status='content_ready'",
        (niche, TODAY)
    ).fetchone()[0]

    platform_breakdown = conn.execute(
        "SELECT platform, COUNT(*) as cnt FROM social_posts WHERE niche=? AND created_at=? GROUP BY platform",
        (niche, TODAY)
    ).fetchall()

    return {
        "products_added": products_added,
        "blogs_posted": blogs_posted,
        "social_scheduled": social_scheduled,
        "social_content_ready": social_content_ready,
        "platform_breakdown": {row["platform"]: row["cnt"] for row in platform_breakdown},
    }


# ── Telegram Sender ───────────────────────────────────────────────────────────
def send_telegram(message: str) -> bool:
    tg = CFG["telegram"]
    token = tg["bot_token"]
    chat_id = tg["chat_id"]

    if "YOUR_" in token:
        log.warning("Telegram not configured — skipping send")
        return False

    try:
        resp = httpx.post(
            f"https://api.telegram.org/bot{token}/sendMessage",
            json={
                "chat_id": chat_id,
                "text": message,
                "parse_mode": "Markdown",
            },
            timeout=15,
        )
        resp.raise_for_status()
        log.info("Telegram message sent successfully")
        return True
    except Exception as e:
        log.error(f"Telegram send failed: {e}")
        return False


def send_whatsapp(message: str) -> bool:
    wa = CFG.get("whatsapp", {})
    if not wa.get("enabled") or "YOUR_" in wa.get("api_key", "YOUR_"):
        return False

    try:
        resp = httpx.get(
            wa["api_url"],
            params={
                "phone": wa["phone"],
                "text": message,
                "apikey": wa["api_key"],
            },
            timeout=15,
        )
        resp.raise_for_status()
        log.info("WhatsApp message sent successfully")
        return True
    except Exception as e:
        log.error(f"WhatsApp send failed: {e}")
        return False


# ── Report Formatter ──────────────────────────────────────────────────────────
def format_report(all_stats: dict) -> str:
    total_products = sum(s["db"]["products_added"] for s in all_stats.values())
    total_blogs = sum(s["db"]["blogs_posted"] for s in all_stats.values())
    total_social = sum(s["db"]["social_scheduled"] for s in all_stats.values())
    total_revenue = sum(s["woo"]["total_sales"] for s in all_stats.values())
    total_orders = sum(s["woo"]["total_orders"] for s in all_stats.values())

    lines = [
        f"🤖 *Dropship Empire — Daily CEO Report*",
        f"📅 {TODAY}",
        f"{'─' * 32}",
        f"",
        f"*EMPIRE SUMMARY*",
        f"🛍  Products Published: *{total_products}*",
        f"✍️  Blog Posts Live: *{total_blogs}*",
        f"📲  Social Posts Queued: *{total_social}*",
        f"💰  Revenue (24h): *${total_revenue:.2f} AUD*",
        f"📦  Orders: *{total_orders}*",
        f"",
    ]

    for niche, stats in all_stats.items():
        db = stats["db"]
        woo = stats["woo"]
        store_name = CFG["niches"][niche]["store_name"]
        platform_str = ", ".join(
            f"{p.title()}: {c}" for p, c in db["platform_breakdown"].items()
        ) or "None"

        lines += [
            f"*{store_name.upper()}*",
            f"  • Products: {db['products_added']} | Blogs: {db['blogs_posted']}",
            f"  • Social: {platform_str}",
            f"  • Revenue: ${woo['total_sales']:.2f} AUD | Orders: {woo['total_orders']}",
            f"",
        ]

    lines += [
        f"{'─' * 32}",
        f"_Agents ran at 04:00 AEST. Next run tomorrow._",
        f"_Your empire never sleeps._ 🦅",
    ]

    return "\n".join(lines)


def save_report(report: str, all_stats: dict):
    """Save report to file and update DB."""
    report_path = Path(CFG["global"]["report_dir"]) / f"report_{TODAY}.txt"
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(report)
    log.info(f"Report saved: {report_path}")

    conn = get_conn(CFG["global"]["db_path"])
    for niche, stats in all_stats.items():
        conn.execute("""
            INSERT OR REPLACE INTO daily_reports
            (report_date, niche, products_added, blogs_posted, social_queued,
             woo_revenue_aud, woo_orders, report_json, sent_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, datetime('now'))
        """, (
            TODAY, niche,
            stats["db"]["products_added"],
            stats["db"]["blogs_posted"],
            stats["db"]["social_scheduled"],
            stats["woo"]["total_sales"],
            stats["woo"]["total_orders"],
            json.dumps(stats),
        ))
    conn.commit()
    conn.close()


# ── Main ──────────────────────────────────────────────────────────────────────
def run_report():
    log.info("=== CEO Daily Report Starting ===")
    conn = get_conn(CFG["global"]["db_path"])
    all_stats = {}

    for niche_key, niche_cfg in CFG["niches"].items():
        if not niche_cfg.get("enabled", True):
            continue
        log.info(f"Aggregating stats for: {niche_cfg['store_name']}")
        all_stats[niche_key] = {
            "db": aggregate_niche_stats(conn, niche_key),
            "woo": fetch_woo_sales(niche_cfg),
        }

    conn.close()

    report = format_report(all_stats)
    save_report(report, all_stats)

    # Send notifications
    tg_sent = send_telegram(report)
    wa_sent = send_whatsapp(report)

    if not tg_sent and not wa_sent:
        log.warning("No notification channels delivered — check API keys in config.json")

    # Print to stdout for log capture
    print("\n" + report)
    log.info("=== CEO Daily Report Complete ===")


if __name__ == "__main__":
    run_report()
