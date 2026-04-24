#!/usr/bin/env python3
"""
AI CEO Agent — Autonomous Dropshipping Empire Manager
Runs daily to analyze state, execute tasks, and report progress toward $1M AUD.

Usage:
    python _common/ceo.py                 # Full daily CEO run
    python _common/ceo.py --niche pet     # Single niche focus
    python _common/ceo.py --dry-run       # Plan only, no scout/hype execution
    python _common/ceo.py --brief-only    # Send today's briefing without execution
"""
import argparse
import json
import logging
import re
import subprocess
import sys
from datetime import date, datetime, timedelta
from pathlib import Path
from typing import Optional
from zoneinfo import ZoneInfo

import anthropic
import httpx
from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "_common"))
from db import get_conn, get_wp_url, api_url

with open(ROOT / "config.json") as f:
    CFG = json.load(f)

AEST = ZoneInfo("Australia/Sydney")
TODAY = str(date.today())
LOG_DIR = Path(CFG["global"]["log_dir"])
LOG_DIR.mkdir(parents=True, exist_ok=True)

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [CEO] %(levelname)s %(message)s",
    handlers=[
        logging.FileHandler(LOG_DIR / f"ceo_{TODAY}.log"),
        logging.StreamHandler(),
    ],
)
log = logging.getLogger("ceo")

claude = anthropic.Anthropic(api_key=CFG["claude"]["api_key"])
MODEL = CFG["claude"]["model"]
PYTHON = ROOT / "venv" / "bin" / "python3"
CEO_STATE_PATH = ROOT / "db" / "ceo_state.json"

# ── Milestone roadmap ──────────────────────────────────────────────────────────
MILESTONES = [
    {"name": "pre-launch",  "target_monthly":      0, "deadline": "2026-05-15",
     "description": "Deploy stores live, configure domains + Telegram + MixPost"},
    {"name": "launch",      "target_monthly":   2000, "deadline": "2026-06-30",
     "description": "First 50 products live, first 10 orders, $2K/month"},
    {"name": "traction",    "target_monthly":  10000, "deadline": "2026-08-31",
     "description": "100+ products, social media active, SEO traffic, $10K/month"},
    {"name": "growth",      "target_monthly":  40000, "deadline": "2026-11-30",
     "description": "Paid ads (Google/Meta), upsells, bundles, $40K/month"},
    {"name": "scale",       "target_monthly":  80000, "deadline": "2027-01-31",
     "description": "Christmas peak, loyalty program, influencers, $80K/month"},
    {"name": "peak",        "target_monthly": 100000, "deadline": "2027-04-24",
     "description": "$1M cumulative hit, both brands profitable"},
]

DEFAULT_STATE = {
    "start_date": "2026-04-24",
    "target_revenue_aud": 1000000,
    "target_date": "2027-04-24",
    "cumulative_revenue_aud": 0.0,
    "current_phase": "pre-launch",
    "milestones": MILESTONES,
    "stores_live": False,
    "pending_user_actions": [],
    "strategic_memos": [],
    "competitor_intel": {},
    "last_run": None,
    "daily_wins": [],
    # Learning & history additions
    "work_history": [],         # Full daily task records — what was done each day
    "learning_ledger": [],      # CEO's extracted learnings: what worked, what didn't
    "tomorrow_plan": None,      # Plan created at end of each day for the next day
    "revenue_trend": [],        # Daily revenue snapshots for trend analysis
    "experiment_log": [],       # Pricing/content/product experiments and outcomes
}

# ── State helpers ──────────────────────────────────────────────────────────────

def load_state() -> dict:
    if CEO_STATE_PATH.exists():
        with open(CEO_STATE_PATH) as f:
            st = json.load(f)
        for k, v in DEFAULT_STATE.items():
            if k not in st:
                st[k] = v
        return st
    return DEFAULT_STATE.copy()


def save_state(state: dict):
    CEO_STATE_PATH.parent.mkdir(parents=True, exist_ok=True)
    with open(CEO_STATE_PATH, "w") as f:
        json.dump(state, f, indent=2, default=str)


# ── Business metrics ───────────────────────────────────────────────────────────

def fetch_woo_metrics(niche_cfg: dict, days: int = 7) -> dict:
    base_url = get_wp_url(niche_cfg, CFG["global"])
    ck = niche_cfg["woocommerce_consumer_key"]
    cs = niche_cfg["woocommerce_consumer_secret"]
    since = str(date.today() - timedelta(days=days))
    empty = {"revenue_aud": 0, "orders": 0, "avg_order_value": 0,
              "top_products": [], "total_products_live": 0, "period_days": days}
    try:
        r = httpx.get(
            api_url(base_url, f"/wc/v3/orders&after={since}T00:00:00&per_page=100&status=completed,processing"),
            auth=(ck, cs), timeout=15
        )
        r.raise_for_status()
        orders = r.json() if isinstance(r.json(), list) else []

        revenue = sum(float(o.get("total", 0)) for o in orders)
        order_count = len(orders)
        product_rev: dict = {}
        for o in orders:
            for li in o.get("line_items", []):
                name = li.get("name", "Unknown")
                product_rev[name] = product_rev.get(name, 0) + float(li.get("total", 0))
        top = sorted(product_rev.items(), key=lambda x: x[1], reverse=True)[:5]

        r2 = httpx.get(
            api_url(base_url, "/wc/v3/products&per_page=1&status=publish"),
            auth=(ck, cs), timeout=15
        )
        r2.raise_for_status()
        total_products = int(r2.headers.get("X-WP-Total", 0))

        return {
            "revenue_aud": revenue,
            "orders": order_count,
            "avg_order_value": revenue / max(order_count, 1),
            "top_products": top,
            "total_products_live": total_products,
            "period_days": days,
        }
    except Exception as e:
        log.warning(f"WooCommerce metrics failed ({niche_cfg['store_name']}): {e}")
        return empty


def get_db_pipeline_stats(niche: str) -> dict:
    conn = get_conn(CFG["global"]["db_path"])
    last_7 = str(date.today() - timedelta(days=7))
    p7 = conn.execute(
        "SELECT COUNT(*) FROM products WHERE niche=? AND created_at>=? AND status='published'",
        (niche, last_7)).fetchone()[0]
    total = conn.execute(
        "SELECT COUNT(*) FROM products WHERE niche=? AND status='published'", (niche,)).fetchone()[0]
    social7 = conn.execute(
        "SELECT COUNT(*) FROM social_posts WHERE niche=? AND created_at>=?",
        (niche, last_7)).fetchone()[0]
    rev7 = conn.execute(
        "SELECT COALESCE(SUM(woo_revenue_aud),0) FROM daily_reports WHERE niche=? AND report_date>=?",
        (niche, last_7)).fetchone()[0]
    conn.close()
    return {"products_7d": p7, "total_products_db": total,
            "social_posts_7d": social7, "revenue_7d": rev7}


def build_business_state_text(state: dict) -> str:
    start = datetime.strptime(state["start_date"], "%Y-%m-%d").date()
    target_dt = datetime.strptime(state["target_date"], "%Y-%m-%d").date()
    today = date.today()
    days_elapsed = (today - start).days
    days_remaining = (target_dt - today).days
    cum_rev = state.get("cumulative_revenue_aud", 0.0)
    target_rev = state["target_revenue_aud"]
    pct_rev = cum_rev / target_rev * 100
    required_daily = (target_rev - cum_rev) / max(days_remaining, 1)

    lines = [
        f"=== BUSINESS STATE — {TODAY} ===",
        f"Day {days_elapsed}/365 | {days_remaining} days to target",
        f"Revenue: ${cum_rev:,.2f} AUD / ${target_rev:,} AUD ({pct_rev:.2f}%)",
        f"Required daily run rate: ${required_daily:.2f} AUD",
        f"Current phase: {state['current_phase'].upper()}",
        f"Stores live: {'YES' if state.get('stores_live') else 'NO — CRITICAL BLOCKER'}",
        "",
        "STORE METRICS (last 7 days):",
    ]

    for nk, ncfg in CFG["niches"].items():
        if not ncfg.get("enabled"):
            continue
        woo = fetch_woo_metrics(ncfg, 7)
        db = get_db_pipeline_stats(nk)
        lines += [
            f"  {ncfg['store_name']}:",
            f"    Revenue: ${woo['revenue_aud']:.2f} | Orders: {woo['orders']} | AOV: ${woo['avg_order_value']:.2f}",
            f"    Products live (WC): {woo['total_products_live']} | DB total: {db['total_products_db']}",
            f"    New products (7d): {db['products_7d']} | Social posts (7d): {db['social_posts_7d']}",
        ]
        if woo["top_products"]:
            top_str = " | ".join(f"{n[:30]} (${r:.0f})" for n, r in woo["top_products"][:3])
            lines.append(f"    Top sellers: {top_str}")

    pending = state.get("pending_user_actions", [])
    if pending:
        lines += ["", f"PENDING USER ACTIONS ({len(pending)}):"]
        for a in pending[-5:]:
            lines.append(f"  [{a.get('priority','?').upper()}] {a.get('title','?')}")

    return "\n".join(lines)


# ── Competitor intelligence ────────────────────────────────────────────────────

COMPETITOR_SOURCES = {
    "pet": [
        {"name": "PetBarn Bestsellers",       "url": "https://www.petbarn.com.au/bestsellers"},
        {"name": "Amazon AU Pet",             "url": "https://www.amazon.com.au/gp/bestsellers/pet-supplies/"},
        {"name": "VetShopAustralia",          "url": "https://www.vetshopaustralia.com.au/"},
    ],
    "auto": [
        {"name": "SuperCheapAuto Trending",   "url": "https://www.supercheapauto.com.au/cool/trending"},
        {"name": "Amazon AU Automotive",      "url": "https://www.amazon.com.au/gp/bestsellers/automotive/"},
        {"name": "Autobarn Sale",             "url": "https://www.autobarn.com.au/sale"},
    ],
}

_HEADERS = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0.0.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-AU,en;q=0.9",
}


def _scrape_page(url: str, name: str) -> str:
    try:
        r = httpx.get(url, headers=_HEADERS, timeout=20, follow_redirects=True)
        r.raise_for_status()
        soup = BeautifulSoup(r.text, "lxml")
        for tag in soup(["script", "style", "nav", "footer", "header", "aside"]):
            tag.decompose()

        titles = [t.get_text(" ", strip=True)
                  for t in soup.select("h2,h3,[class*='product-name'],[class*='product-title'],[class*='item-name']")
                  if t.get_text(strip=True)][:15]
        prices = [p.get_text(strip=True)
                  for p in soup.select("[class*='price'],[class*='Price'],[data-price]")
                  if p.get_text(strip=True)][:15]
        promos = [p.get_text(strip=True)
                  for p in soup.select("[class*='sale'],[class*='badge'],[class*='promo'],[class*='discount']")
                  if p.get_text(strip=True)][:8]

        out = f"Source: {name}\nURL: {url}\n"
        if titles:
            out += f"Products: {' | '.join(titles[:10])}\n"
        if prices:
            out += f"Prices: {' | '.join(prices[:10])}\n"
        if promos:
            out += f"Promos: {' | '.join(promos[:5])}\n"
        return out
    except Exception as e:
        return f"Source: {name} — fetch failed ({e}). Use market knowledge."


def analyze_competitors_for_niche(niche: str) -> str:
    sources = COMPETITOR_SOURCES.get(niche, [])
    raw = [_scrape_page(s["url"], s["name"]) for s in sources]
    ncfg = CFG["niches"][niche]

    prompt = f"""You are a competitive intelligence analyst for {ncfg['store_name']}, an Australian dropshipping store.

Raw competitor data:
{chr(10).join(raw)}

Store: {ncfg['store_name']} | Categories: {', '.join(ncfg['categories'])}
Price range: ${ncfg['min_price_aud']}-${ncfg['max_price_aud']} AUD | Target margin: {ncfg['target_margin_pct']}%

Provide structured intelligence (max 350 words):
1. TRENDING NOW: Specific products selling well in AU right now
2. PRICE LANDSCAPE: Price ranges, any active sales/promotions
3. MARKET GAPS: What competitors DON'T have (our opportunity)
4. URGENT RESPONSE: Any competitor promotion we should counter today
5. TOP ACTION: The single most impactful action to take based on this data

Be specific and actionable — real product names, real price points."""

    resp = claude.messages.create(
        model=MODEL, max_tokens=700,
        messages=[{"role": "user", "content": prompt}]
    )
    return resp.content[0].text.strip()


# ── Tool handler implementations ───────────────────────────────────────────────

_queued_actions: list = []
_task_log: list = []


def tool_read_business_state(period_days: int = 7) -> str:
    state = load_state()
    return build_business_state_text(state)


def tool_analyze_competitors(niche: str, focus: str = "all") -> str:
    log.info(f"Competitor analysis: {niche}")
    result = analyze_competitors_for_niche(niche)
    state = load_state()
    state.setdefault("competitor_intel", {})[niche] = {"date": TODAY, "summary": result[:1200]}
    save_state(state)
    _task_log.append(f"Competitor analysis: {niche}")
    return result


def tool_run_product_scout(niche: str) -> str:
    log.info(f"Product scout: {niche}")
    try:
        result = subprocess.run(
            [str(PYTHON), str(ROOT / "_common" / "scout.py"), niche],
            capture_output=True, text=True, timeout=600, cwd=str(ROOT)
        )
        out = (result.stdout + result.stderr)[-1200:]
        status = "completed" if result.returncode == 0 else f"finished with errors (rc={result.returncode})"
        _task_log.append(f"Scout {status}: {niche}")
        return f"Scout {niche} {status}.\n{out}"
    except subprocess.TimeoutExpired:
        return f"Scout {niche} timed out (10 min) — browser agent may need more time. Check logs."
    except Exception as e:
        return f"Scout {niche} failed: {e}"


def tool_run_social_hype(niche: str) -> str:
    log.info(f"Social hype: {niche}")
    try:
        result = subprocess.run(
            [str(PYTHON), str(ROOT / "_common" / "hype.py"), niche],
            capture_output=True, text=True, timeout=180, cwd=str(ROOT)
        )
        out = (result.stdout + result.stderr)[-600:]
        status = "completed" if result.returncode == 0 else "had errors"
        _task_log.append(f"Hype {status}: {niche}")
        return f"Hype {niche} {status}.\n{out}"
    except Exception as e:
        return f"Hype {niche} failed: {e}"


def tool_update_product_pricing(niche: str, strategy: str, adjustment_pct: float = None) -> str:
    ncfg = CFG["niches"][niche]
    base_url = get_wp_url(ncfg, CFG["global"])
    ck, cs = ncfg["woocommerce_consumer_key"], ncfg["woocommerce_consumer_secret"]

    if adjustment_pct is None:
        adjustment_pct = {"undercut_competitors": -5, "premium_positioning": 10, "volume_play": -3}.get(strategy, 0)

    try:
        r = httpx.get(api_url(base_url, "/wc/v3/products&per_page=50&status=publish"),
                      auth=(ck, cs), timeout=20)
        r.raise_for_status()
        products = r.json() if isinstance(r.json(), list) else []
        if not products:
            return f"No products to reprice for {niche}"

        updated = 0
        for p in products[:20]:
            current = float(p.get("regular_price", 0) or 0)
            if current <= 0:
                continue
            new_price = round(current * (1 + adjustment_pct / 100), 2)
            new_price = max(ncfg["min_price_aud"], min(ncfg["max_price_aud"], new_price))
            r2 = httpx.put(
                api_url(base_url, f"/wc/v3/products/{p['id']}"),
                auth=(ck, cs), json={"regular_price": str(new_price)}, timeout=15
            )
            if r2.status_code == 200:
                updated += 1

        msg = f"Repriced {updated} products in {niche} ({strategy}, {adjustment_pct:+.1f}%)"
        _task_log.append(msg)
        return msg
    except Exception as e:
        return f"Pricing update failed for {niche}: {e}"


def tool_publish_seo_content(niche: str, content_type: str, topic: str) -> str:
    ncfg = CFG["niches"][niche]
    base_url = get_wp_url(ncfg, CFG["global"])
    wp_user = ncfg.get("wp_user", "admin")
    wp_app_pass = ncfg.get("wp_app_password", "")

    type_desc = {
        "blog_post": "an engaging 800-word blog post",
        "buying_guide": "a comprehensive 1000-word buying guide",
        "how_to": "a practical step-by-step 700-word how-to guide",
        "product_roundup": "a '10 Best' style 1000-word product roundup",
    }.get(content_type, "an 800-word blog post")

    prompt = f"""Write {type_desc} for {ncfg['store_name']}, an Australian dropshipping store.

Topic: {topic}
Brand voice: {ncfg['brand_voice']}
Target keywords: {', '.join(ncfg.get('target_keywords', [])[:4])}
Date: {TODAY}

Return JSON only:
{{
  "title": "SEO H1 title (include primary keyword)",
  "slug": "url-slug",
  "content": "Full post in HTML (use h2, h3, ul, li, p, strong)",
  "excerpt": "SEO meta description (155 chars max)"
}}

Include Aussie cultural references, mention fast Australian delivery, and AUD price examples. Naturally use keywords 3-4 times."""

    try:
        resp = claude.messages.create(
            model=MODEL, max_tokens=CFG["claude"]["max_tokens"],
            messages=[{"role": "user", "content": prompt}]
        )
        raw = re.sub(r'^```json?\s*|\s*```$', '', resp.content[0].text.strip(), flags=re.MULTILINE)
        post = json.loads(raw)

        r = httpx.post(
            api_url(base_url, "/wp/v2/posts"),
            auth=(wp_user, wp_app_pass),
            json={"title": post["title"], "content": post["content"],
                  "slug": post["slug"], "excerpt": post.get("excerpt", ""), "status": "publish"},
            timeout=30
        )
        r.raise_for_status()
        post_id = r.json().get("id")
        msg = f"Published {content_type} '{post['title']}' to {niche} (ID: {post_id})"
        _task_log.append(msg)
        return msg
    except Exception as e:
        return f"SEO content publish failed for {niche}: {e}"


def tool_queue_user_action(priority: str, title: str, description: str,
                            impact: str, estimated_time: str = "15 minutes") -> str:
    action = {
        "id": f"{TODAY}_{len(_queued_actions)+1}",
        "priority": priority, "title": title,
        "description": description, "impact": impact,
        "estimated_time": estimated_time, "queued_date": TODAY,
    }
    _queued_actions.append(action)
    log.info(f"User action queued [{priority.upper()}]: {title}")
    return f"Queued [{priority.upper()}]: {title}"


def tool_save_strategic_memo(title: str, decision: str, rationale: str,
                              expected_outcome: str = "") -> str:
    memo = {"date": TODAY, "title": title, "decision": decision,
            "rationale": rationale, "expected_outcome": expected_outcome}
    state = load_state()
    state.setdefault("strategic_memos", []).append(memo)
    state["strategic_memos"] = state["strategic_memos"][-30:]
    save_state(state)
    return f"Memo saved: {title}"


def tool_record_learning(category: str, insight: str, evidence: str,
                          action_going_forward: str, niche: str = "both") -> str:
    """Record a learning extracted from today's data or experience."""
    learning = {
        "date": TODAY,
        "category": category,     # pricing, product, social, seo, operations, market
        "niche": niche,
        "insight": insight,
        "evidence": evidence,
        "action_going_forward": action_going_forward,
    }
    state = load_state()
    state.setdefault("learning_ledger", []).append(learning)
    state["learning_ledger"] = state["learning_ledger"][-60:]  # Keep 60 days
    save_state(state)
    log.info(f"Learning recorded [{category}]: {insight[:80]}")
    return f"Learning recorded: [{category}/{niche}] {insight[:100]}"


def tool_log_work_completed(tasks_done: list, tasks_failed: list,
                             revenue_delta: float, notes: str = "") -> str:
    """Log a complete record of today's work for historical analysis."""
    state = load_state()
    record = {
        "date": TODAY,
        "tasks_done": tasks_done,
        "tasks_failed": tasks_failed,
        "revenue_delta_aud": revenue_delta,
        "notes": notes,
        "phase": state.get("current_phase", "unknown"),
        "cumulative_revenue_at_close": state.get("cumulative_revenue_aud", 0.0) + revenue_delta,
    }
    state.setdefault("work_history", []).append(record)
    state["work_history"] = state["work_history"][-90:]  # Keep 90 days

    # Update cumulative revenue
    state["cumulative_revenue_aud"] = state.get("cumulative_revenue_aud", 0.0) + revenue_delta

    # Revenue trend snapshot
    state.setdefault("revenue_trend", []).append({
        "date": TODAY,
        "cumulative": state["cumulative_revenue_aud"],
        "daily": revenue_delta,
    })
    state["revenue_trend"] = state["revenue_trend"][-90:]

    # Auto-advance phase based on cumulative revenue
    phases_by_revenue = [
        ("pre-launch", 0),
        ("launch", 500),
        ("traction", 5000),
        ("growth", 30000),
        ("scale", 200000),
        ("peak", 700000),
    ]
    rev = state["cumulative_revenue_aud"]
    for phase_name, threshold in reversed(phases_by_revenue):
        if rev >= threshold:
            if state.get("current_phase") != phase_name:
                log.info(f"PHASE ADVANCE: {state.get('current_phase')} → {phase_name}")
            state["current_phase"] = phase_name
            break

    save_state(state)
    log.info(f"Work log saved: {len(tasks_done)} done, {len(tasks_failed)} failed, +${revenue_delta:.2f} revenue")
    return f"Work logged: {len(tasks_done)} tasks done, {len(tasks_failed)} failed, revenue delta: +${revenue_delta:.2f} AUD"


def tool_set_tomorrow_plan(priorities: list, experiments: list,
                            blocked_on: list, revenue_target_aud: float) -> str:
    """CEO creates the plan for tomorrow based on today's learnings."""
    plan = {
        "created_date": TODAY,
        "for_date": str(date.today() + timedelta(days=1)),
        "priorities": priorities,           # Ordered list of tomorrow's top actions
        "experiments": experiments,         # Things to test/try tomorrow
        "blocked_on": blocked_on,           # What user must do before these can proceed
        "revenue_target_aud": revenue_target_aud,
        "context": f"Plan set after Day {(date.today() - datetime.strptime(load_state()['start_date'], '%Y-%m-%d').date()).days} of campaign",
    }
    state = load_state()
    state["tomorrow_plan"] = plan
    save_state(state)
    log.info(f"Tomorrow's plan set: {len(priorities)} priorities, target ${revenue_target_aud:.2f}")
    return f"Tomorrow's plan set ({plan['for_date']}): {len(priorities)} priorities, ${revenue_target_aud:.2f} target"


def tool_review_history(lookback_days: int = 7) -> str:
    """Read work history, learnings, and yesterday's plan to inform today's decisions."""
    state = load_state()
    today = date.today()
    cutoff = str(today - timedelta(days=lookback_days))

    # Yesterday's plan
    plan = state.get("tomorrow_plan")
    plan_str = ""
    if plan and plan.get("for_date") == str(today):
        plan_str = f"\nYESTERDAY'S PLAN FOR TODAY:\n"
        plan_str += f"  Priorities: {json.dumps(plan.get('priorities', []))}\n"
        plan_str += f"  Experiments: {json.dumps(plan.get('experiments', []))}\n"
        plan_str += f"  Blocked on: {json.dumps(plan.get('blocked_on', []))}\n"
        plan_str += f"  Revenue target set: ${plan.get('revenue_target_aud', 0):.2f}\n"
    elif plan:
        plan_str = f"\n(Last plan was for {plan.get('for_date')} — {(today - datetime.strptime(plan.get('for_date', str(today)), '%Y-%m-%d').date()).days} days ago)\n"

    # Recent work history
    recent_work = [w for w in state.get("work_history", []) if w["date"] >= cutoff]
    work_str = f"\nWORK HISTORY (last {lookback_days} days):\n"
    for w in recent_work[-7:]:
        work_str += f"  {w['date']} | Phase: {w['phase']} | Revenue: +${w['revenue_delta_aud']:.2f}\n"
        if w.get("tasks_done"):
            work_str += f"    Done: {', '.join(str(t) for t in w['tasks_done'][:5])}\n"
        if w.get("tasks_failed"):
            work_str += f"    Failed: {', '.join(str(t) for t in w['tasks_failed'][:3])}\n"

    # Recent learnings
    recent_learnings = [l for l in state.get("learning_ledger", []) if l["date"] >= cutoff]
    learn_str = f"\nRECENT LEARNINGS ({len(recent_learnings)} in last {lookback_days} days):\n"
    for l in recent_learnings[-8:]:
        learn_str += f"  [{l['date']}][{l['category']}/{l['niche']}] {l['insight']}\n"
        learn_str += f"    → Going forward: {l['action_going_forward']}\n"

    # Revenue trend
    rev_trend = state.get("revenue_trend", [])[-7:]
    trend_str = "\nREVENUE TREND (last 7 days):\n"
    for r in rev_trend:
        trend_str += f"  {r['date']}: daily +${r['daily']:.2f} | cumulative ${r['cumulative']:,.2f}\n"

    # Experiments
    experiments = [e for e in state.get("experiment_log", []) if e.get("date", "") >= cutoff]
    exp_str = ""
    if experiments:
        exp_str = f"\nACTIVE EXPERIMENTS:\n"
        for e in experiments[-5:]:
            exp_str += f"  [{e['date']}] {e.get('description', '')} → outcome: {e.get('outcome', 'pending')}\n"

    return plan_str + work_str + learn_str + trend_str + exp_str


def tool_send_ceo_briefing(executive_summary: str, wins_today: list,
                            strategic_focus: str, revenue_update: str = "",
                            user_actions: list = None) -> str:
    state = load_state()
    cum_rev = state.get("cumulative_revenue_aud", 0.0)
    target = state["target_revenue_aud"]
    pct = cum_rev / target * 100
    start_dt = datetime.strptime(state["start_date"], "%Y-%m-%d").date()
    target_dt = datetime.strptime(state["target_date"], "%Y-%m-%d").date()
    today = date.today()
    days_elapsed = (today - start_dt).days
    days_remaining = (target_dt - today).days

    bar_filled = int(pct / 5)
    bar = "█" * bar_filled + "░" * (20 - bar_filled)

    # Merge user actions
    all_actions = _queued_actions.copy()
    if user_actions:
        for ua in user_actions:
            all_actions.append({"priority": "high", "title": ua, "description": ua, "impact": ""})

    # Persist actions
    state.setdefault("pending_user_actions", [])
    existing_ids = {a.get("id") for a in state["pending_user_actions"]}
    for a in _queued_actions:
        if a.get("id") not in existing_ids:
            state["pending_user_actions"].append(a)
    state["pending_user_actions"] = state["pending_user_actions"][-20:]

    # Save today's wins
    state.setdefault("daily_wins", [])
    state["daily_wins"].append({"date": TODAY, "wins": wins_today, "tasks": _task_log.copy()})
    state["daily_wins"] = state["daily_wins"][-30:]
    state["last_run"] = TODAY
    save_state(state)

    # Format action items
    emoji_map = {"critical": "🚨", "high": "🔴", "medium": "🟡", "low": "🟢"}
    action_lines = []
    sorted_actions = sorted(all_actions, key=lambda a: ["critical","high","medium","low"].index(a.get("priority","low")))
    for a in sorted_actions[:8]:
        e = emoji_map.get(a.get("priority", "medium"), "🟡")
        action_lines.append(f"{e} *{a['title']}*")
        action_lines.append(f"   {a['description'][:130]}")
        if a.get("impact"):
            action_lines.append(f"   _Why: {a['impact'][:90]}_")
        if a.get("estimated_time"):
            action_lines.append(f"   _Time: {a['estimated_time']}_")

    wins_str = "\n".join(f"  ✅ {w}" for w in wins_today[:8]) or "  📋 Preparation work completed"
    actions_str = "\n".join(action_lines) if action_lines else "  None today — fully autonomous!"

    # Yesterday's plan vs today's outcomes
    plan = state.get("tomorrow_plan")
    plan_review = ""
    if plan and plan.get("created_date") != TODAY:
        plan_items = plan.get("priorities", [])[:3]
        plan_review = "\n\n📋 *YESTERDAY'S PLAN VS TODAY*\n"
        for item in plan_items:
            done = any(item.lower()[:20] in str(t).lower() for t in wins_today)
            plan_review += f"  {'✅' if done else '⏳'} {item[:80]}\n"

    # Recent learnings count
    learnings = state.get("learning_ledger", [])
    today_learnings = [l for l in learnings if l.get("date") == TODAY]
    learn_note = f"\n_Learnings recorded today: {len(today_learnings)}_" if today_learnings else ""

    msg = f"""🤖 *AI CEO Briefing — {today.strftime('%A %d %B %Y')}*
━━━━━━━━━━━━━━━━━━━━━━━━━━

💼 *EXECUTIVE SUMMARY*
{executive_summary}

💰 *PROGRESS TO $1M*
`{bar}` {pct:.1f}%
${cum_rev:,.0f} / $1,000,000 AUD
Day {days_elapsed}/365 | Phase: *{state['current_phase'].upper()}*
{days_remaining} days remaining{f' | {revenue_update}' if revenue_update else ''}
{plan_review}
🏆 *TODAY'S WINS*
{wins_str}
{learn_note}

🎯 *TOMORROW'S FOCUS*
{strategic_focus}

━━━━━━━━━━━━━━━━━━━━━━━━━━
👤 *OWNER ACTION ITEMS*
{actions_str}

━━━━━━━━━━━━━━━━━━━━━━━━━━
_Your empire never sleeps. 🦅_
_Full log: logs/ceo\\_{TODAY}.log_"""

    tg = CFG["telegram"]
    token = tg.get("bot_token", "")
    chat_id = tg.get("chat_id", "")
    sent = False

    if token and "YOUR_" not in token:
        try:
            r = httpx.post(
                f"https://api.telegram.org/bot{token}/sendMessage",
                json={"chat_id": chat_id, "text": msg, "parse_mode": "Markdown"},
                timeout=15
            )
            r.raise_for_status()
            sent = True
            log.info("CEO briefing sent via Telegram")
        except Exception as e:
            log.error(f"Telegram send failed: {e}")

    report_path = Path(CFG["global"]["report_dir"]) / f"ceo_briefing_{TODAY}.txt"
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(msg)
    log.info(f"CEO briefing saved: {report_path}")

    return f"Briefing {'sent via Telegram + ' if sent else ''}saved to {report_path}. Daily run complete."


# ── Anthropic tool definitions ─────────────────────────────────────────────────

CEO_TOOLS = [
    {
        "name": "read_business_state",
        "description": "Read all current business metrics: revenue, orders, products, social posts, milestone progress vs $1M target. Call this FIRST every day.",
        "input_schema": {
            "type": "object",
            "properties": {
                "period_days": {"type": "integer", "description": "Days to aggregate (default 7)", "default": 7}
            }
        }
    },
    {
        "name": "analyze_competitors",
        "description": "Scrape and analyze competitor pricing, trending products, promotions for a niche. Essential intelligence for staying ahead in the Australian market.",
        "input_schema": {
            "type": "object",
            "properties": {
                "niche": {"type": "string", "enum": ["pet", "auto"]},
                "focus": {"type": "string", "description": "Focus area: prices, trending_products, promotions, gaps", "default": "all"}
            },
            "required": ["niche"]
        }
    },
    {
        "name": "run_product_scout",
        "description": "Run the AI product scout agent. Finds 5 trending products from AU marketplace, generates WooCommerce listings and SEO blog posts.",
        "input_schema": {
            "type": "object",
            "properties": {
                "niche": {"type": "string", "enum": ["pet", "auto"]}
            },
            "required": ["niche"]
        }
    },
    {
        "name": "run_social_hype",
        "description": "Generate and schedule TikTok, Instagram, Pinterest content for today's scouted products.",
        "input_schema": {
            "type": "object",
            "properties": {
                "niche": {"type": "string", "enum": ["pet", "auto"]}
            },
            "required": ["niche"]
        }
    },
    {
        "name": "update_product_pricing",
        "description": "Adjust WooCommerce product prices based on competitive intelligence. Use after competitor analysis reveals pricing opportunities.",
        "input_schema": {
            "type": "object",
            "properties": {
                "niche": {"type": "string", "enum": ["pet", "auto"]},
                "strategy": {"type": "string", "enum": ["undercut_competitors", "premium_positioning", "volume_play"],
                             "description": "undercut = -5%, premium = +10%, volume = -3%"},
                "adjustment_pct": {"type": "number", "description": "Override: custom price adjustment % (+/-)"}
            },
            "required": ["niche", "strategy"]
        }
    },
    {
        "name": "publish_seo_content",
        "description": "Generate and publish an SEO blog post or guide to build organic Google traffic for the Australian market.",
        "input_schema": {
            "type": "object",
            "properties": {
                "niche": {"type": "string", "enum": ["pet", "auto"]},
                "content_type": {"type": "string", "enum": ["blog_post", "buying_guide", "how_to", "product_roundup"]},
                "topic": {"type": "string", "description": "Topic/keyword e.g. 'best dog harnesses Australia 2026'"}
            },
            "required": ["niche", "content_type", "topic"]
        }
    },
    {
        "name": "queue_user_action",
        "description": "Queue a specific action only the human owner can do (account setups, payments, domains, SSH, Telegram). Be EXACT — give step-by-step instructions.",
        "input_schema": {
            "type": "object",
            "properties": {
                "priority": {"type": "string", "enum": ["critical", "high", "medium", "low"]},
                "title": {"type": "string", "description": "Short title (max 60 chars)"},
                "description": {"type": "string", "description": "Exact step-by-step instructions"},
                "impact": {"type": "string", "description": "Revenue/growth impact if done today"},
                "estimated_time": {"type": "string", "description": "e.g. '10 minutes'"}
            },
            "required": ["priority", "title", "description", "impact"]
        }
    },
    {
        "name": "save_strategic_memo",
        "description": "Save a strategic decision or market insight to CEO memory for future reference and pattern recognition.",
        "input_schema": {
            "type": "object",
            "properties": {
                "title": {"type": "string"},
                "decision": {"type": "string"},
                "rationale": {"type": "string"},
                "expected_outcome": {"type": "string"}
            },
            "required": ["title", "decision", "rationale"]
        }
    },
    {
        "name": "review_history",
        "description": "Read CEO work history, learning ledger, and yesterday's plan. Call this SECOND (after read_business_state) to pick up where yesterday left off.",
        "input_schema": {
            "type": "object",
            "properties": {
                "lookback_days": {"type": "integer", "description": "Days to look back (default 7)", "default": 7}
            }
        }
    },
    {
        "name": "record_learning",
        "description": "Record a specific insight or learning from today's data. Use throughout the run whenever you spot a pattern, what worked, or what failed.",
        "input_schema": {
            "type": "object",
            "properties": {
                "category": {"type": "string", "enum": ["pricing", "product", "social", "seo", "operations", "market", "customer"],
                             "description": "Category of the learning"},
                "niche": {"type": "string", "enum": ["pet", "auto", "both"]},
                "insight": {"type": "string", "description": "What you learned (specific, not vague)"},
                "evidence": {"type": "string", "description": "What data or observation led to this insight"},
                "action_going_forward": {"type": "string", "description": "How this changes tomorrow's approach"}
            },
            "required": ["category", "insight", "evidence", "action_going_forward"]
        }
    },
    {
        "name": "log_work_completed",
        "description": "Log today's complete work record for history. Call BEFORE send_ceo_briefing.",
        "input_schema": {
            "type": "object",
            "properties": {
                "tasks_done": {"type": "array", "items": {"type": "string"}, "description": "List of tasks completed today"},
                "tasks_failed": {"type": "array", "items": {"type": "string"}, "description": "Tasks that failed or were blocked"},
                "revenue_delta": {"type": "number", "description": "Revenue earned today in AUD (usually 0 until stores are live)"},
                "notes": {"type": "string", "description": "Any important context for future reference"}
            },
            "required": ["tasks_done", "tasks_failed", "revenue_delta"]
        }
    },
    {
        "name": "set_tomorrow_plan",
        "description": "Create tomorrow's execution plan based on today's learnings. Call BEFORE send_ceo_briefing.",
        "input_schema": {
            "type": "object",
            "properties": {
                "priorities": {"type": "array", "items": {"type": "string"},
                               "description": "Ordered list of tomorrow's top 5 actions (most impactful first)"},
                "experiments": {"type": "array", "items": {"type": "string"},
                                "description": "Things to test tomorrow (A/B pricing, new product category, different content style)"},
                "blocked_on": {"type": "array", "items": {"type": "string"},
                               "description": "What the user must do before these can proceed"},
                "revenue_target_aud": {"type": "number", "description": "Revenue target for tomorrow specifically"}
            },
            "required": ["priorities", "revenue_target_aud"]
        }
    },
    {
        "name": "send_ceo_briefing",
        "description": "Send the CEO daily briefing via Telegram to the owner. ALWAYS call this LAST — it closes the daily run.",
        "input_schema": {
            "type": "object",
            "properties": {
                "executive_summary": {"type": "string", "description": "2-3 sentence summary of the day"},
                "wins_today": {
                    "type": "array", "items": {"type": "string"},
                    "description": "List of things accomplished today"
                },
                "strategic_focus": {"type": "string", "description": "Single most important priority for tomorrow"},
                "revenue_update": {"type": "string", "description": "Revenue trajectory commentary"},
                "user_actions": {
                    "type": "array", "items": {"type": "string"},
                    "description": "Additional ad-hoc user action strings"
                }
            },
            "required": ["executive_summary", "wins_today", "strategic_focus"]
        }
    },
]

# ── Tool dispatcher ────────────────────────────────────────────────────────────

def dispatch(name: str, inputs: dict) -> str:
    handlers = {
        "read_business_state":    lambda: tool_read_business_state(inputs.get("period_days", 7)),
        "review_history":         lambda: tool_review_history(inputs.get("lookback_days", 7)),
        "analyze_competitors":    lambda: tool_analyze_competitors(inputs["niche"], inputs.get("focus", "all")),
        "run_product_scout":      lambda: tool_run_product_scout(inputs["niche"]),
        "run_social_hype":        lambda: tool_run_social_hype(inputs["niche"]),
        "update_product_pricing": lambda: tool_update_product_pricing(inputs["niche"], inputs["strategy"], inputs.get("adjustment_pct")),
        "publish_seo_content":    lambda: tool_publish_seo_content(inputs["niche"], inputs["content_type"], inputs["topic"]),
        "queue_user_action":      lambda: tool_queue_user_action(inputs["priority"], inputs["title"], inputs["description"], inputs["impact"], inputs.get("estimated_time", "15 minutes")),
        "save_strategic_memo":    lambda: tool_save_strategic_memo(inputs["title"], inputs["decision"], inputs["rationale"], inputs.get("expected_outcome", "")),
        "record_learning":        lambda: tool_record_learning(inputs["category"], inputs["insight"], inputs["evidence"], inputs["action_going_forward"], inputs.get("niche", "both")),
        "log_work_completed":     lambda: tool_log_work_completed(inputs["tasks_done"], inputs.get("tasks_failed", []), inputs.get("revenue_delta", 0.0), inputs.get("notes", "")),
        "set_tomorrow_plan":      lambda: tool_set_tomorrow_plan(inputs["priorities"], inputs.get("experiments", []), inputs.get("blocked_on", []), inputs.get("revenue_target_aud", 0.0)),
        "send_ceo_briefing":      lambda: tool_send_ceo_briefing(inputs["executive_summary"], inputs["wins_today"], inputs["strategic_focus"], inputs.get("revenue_update", ""), inputs.get("user_actions", [])),
    }
    fn = handlers.get(name)
    return fn() if fn else f"Unknown tool: {name}"


# ── CEO system prompt ──────────────────────────────────────────────────────────

def build_system_prompt(state: dict) -> str:
    start_dt = datetime.strptime(state["start_date"], "%Y-%m-%d").date()
    target_dt = datetime.strptime(state["target_date"], "%Y-%m-%d").date()
    today = date.today()
    days_elapsed = (today - start_dt).days
    days_remaining = (target_dt - today).days
    cum_rev = state.get("cumulative_revenue_aud", 0.0)
    required_daily = (state["target_revenue_aud"] - cum_rev) / max(days_remaining, 1)

    recent_memos = state.get("strategic_memos", [])[-5:]
    memos_str = "\n".join(f"  [{m['date']}] {m['title']}: {m['decision']}" for m in recent_memos) or "  None yet"

    # Yesterday's plan context
    plan = state.get("tomorrow_plan")
    plan_ctx = ""
    if plan:
        plan_date = plan.get("for_date", "")
        plan_ctx = f"\nYESTERDAY'S PLAN (for {plan_date}):\n"
        for i, p in enumerate(plan.get("priorities", [])[:5], 1):
            plan_ctx += f"  {i}. {p}\n"
        if plan.get("experiments"):
            plan_ctx += f"  Experiments queued: {', '.join(plan['experiments'][:3])}\n"

    # Recent learnings summary
    recent_learnings = state.get("learning_ledger", [])[-8:]
    learn_ctx = ""
    if recent_learnings:
        learn_ctx = "\nRECENT LEARNINGS (apply these today):\n"
        for l in recent_learnings:
            learn_ctx += f"  [{l['category']}/{l['niche']}] {l['insight']} → {l['action_going_forward']}\n"

    # Revenue trend
    rev_trend = state.get("revenue_trend", [])[-7:]
    trend_ctx = ""
    if rev_trend:
        trend_ctx = "\nREVENUE TREND:\n"
        for r in rev_trend:
            trend_ctx += f"  {r['date']}: daily ${r['daily']:.2f} | total ${r['cumulative']:,.2f}\n"

    last_intel = state.get("competitor_intel", {})
    intel_str = ""
    for niche, data in last_intel.items():
        if data.get("date") == TODAY:
            intel_str += f"\n  {niche} (today): {data['summary'][:200]}..."

    return f"""You are the AI CEO of two Australian dropshipping brands:

**Furlio** (furlio.au) — Pet supplies for Aussie pet owners
  Brand: Friendly, warm, Aussie. "Your furry mate", "built for Aussie backyards"
  Categories: Dog Accessories, Cat Supplies, Bird & Aquatic, Small Animals
  Price: $15–$250 AUD

**LetsDrive** (letsdrive.au) — Ute, 4WD, and car accessories for Aussie tradies
  Brand: Rugged, no-BS Aussie. "Built tough for the bush", "gear up your ute"
  Categories: Ute Accessories, 4WD & Off-Road, Car Care, Tools & Equipment, Lighting
  Price: $20–$500 AUD

MISSION: Grow combined revenue $0 → $1,000,000 AUD by {target_dt.strftime('%d %B %Y')}.

STATUS:
  Today: {TODAY} | Day {days_elapsed}/365 | {days_remaining} days remaining
  Required daily revenue: ${required_daily:.2f} AUD
  Phase: {state['current_phase'].upper()}
  Stores live: {'YES' if state.get('stores_live') else 'NO — DEPLOY IS THE #1 BLOCKER'}

12-MONTH ROADMAP:
  Month 1-2  (now)    → Get stores LIVE, first orders, validate market
  Month 3    (Jun 26) → $5K/month — 100 products, social media active
  Month 4-5  (Aug 26) → $15K/month — email lists, Google SEO kicking in
  Month 6-7  (Oct 26) → $30K/month — paid ads, product bundles
  Month 8-9  (Dec 26) → $60K/month — Christmas peak, scale winners
  Month 10-12(Apr 27) → $80K-100K/month → $1M total

RECENT STRATEGIC DECISIONS:
{memos_str}
{plan_ctx}
{learn_ctx}
{trend_ctx}
{f"TODAY'S COMPETITOR INTEL:{intel_str}" if intel_str else ""}
LEARNING DIRECTIVE: You have a learning memory. Every day you MUST:
  - Call `review_history` to read yesterday's plan and recent learnings
  - Apply what you learned — don't repeat failed approaches
  - Record new learnings with `record_learning` (be specific, not generic)
  - End each day with `set_tomorrow_plan` so tomorrow's CEO starts with a plan
  - The state file is your brain — it grows smarter every day you run

YOUR DAILY WORKFLOW (execute in this order):
1.  `read_business_state` — understand today's metrics and blockers
2.  `review_history` — read yesterday's plan, recent work, and learnings. NEVER skip this.
3.  `analyze_competitors` for pet — market intelligence
4.  `analyze_competitors` for auto — market intelligence
5.  `record_learning` — capture 1-2 insights from competitor analysis + state review
6.  `save_strategic_memo` — record key decisions you're making today and why
7.  `run_product_scout` for both niches — build product catalog
8.  `run_social_hype` for both niches — drive social traffic
9.  `publish_seo_content` — at least 1 post per niche based on competitor gaps found
10. `update_product_pricing` if competitor analysis warrants it
11. `record_learning` — capture what today's execution revealed (failures are valuable)
12. `queue_user_action` for EVERYTHING that requires human hands — be SPECIFIC
13. `log_work_completed` — record the full day's work for history
14. `set_tomorrow_plan` — create tomorrow's prioritised plan based on today's learnings
15. `send_ceo_briefing` — always last, summarise the day for the owner

WHEN STORES ARE NOT LIVE (current state):
  The highest-revenue action is getting stores deployed. Queue precise technical steps
  for the owner: FastComet SSH credentials, domain DNS config, Telegram bot /start,
  MixPost install, Apache vhost fix. Treat each as a critical blocker with dollar impact.

OPERATING PRINCIPLES:
  • Revenue first — every decision traces to customer acquisition or retention
  • Data beats opinion — read metrics before making calls
  • Be a general giving orders, not a consultant giving options
  • User actions must be EXACT: "Go to X, click Y, paste Z" — not vague
  • Australian market: AUD, AU English, AU shipping times, AU GST (10%)
  • Never duplicate work already in today's task log
  • Move fast — pre-launch days are the most expensive days

You have full authority to: source products, generate content, update prices, publish posts, schedule social media, analyze competitors.
You CANNOT (require owner): access external accounts, spend money, contact customers, change DNS/hosting settings."""


# ── Main CEO loop ──────────────────────────────────────────────────────────────

def run_ceo(dry_run: bool = False, niche_filter: Optional[str] = None, brief_only: bool = False):
    log.info("=" * 60)
    log.info(f"AI CEO STARTING — {TODAY}")
    if dry_run:
        log.info("DRY RUN MODE — scouts/hype will be simulated")
    log.info("=" * 60)

    state = load_state()
    system_prompt = build_system_prompt(state)

    if brief_only:
        initial_msg = f"Today is {TODAY}. Send the daily CEO briefing based on what's in the business state. Read state first, then send briefing."
    elif niche_filter:
        initial_msg = f"Today is {TODAY}. Run the full CEO daily workflow but focus on the {niche_filter} niche only. Start with read_business_state."
    else:
        initial_msg = f"Today is {TODAY}. Run your complete daily CEO workflow for all niches. Start with read_business_state, then competitor analysis for both niches, then execute all daily tasks, and end with send_ceo_briefing. Be thorough and autonomous."

    messages = [{"role": "user", "content": initial_msg}]
    iteration = 0
    max_iterations = 30
    briefing_sent = False

    while iteration < max_iterations and not briefing_sent:
        iteration += 1
        log.info(f"--- CEO iteration {iteration} ---")

        response = claude.messages.create(
            model=MODEL,
            max_tokens=4096,
            system=system_prompt,
            tools=CEO_TOOLS,
            messages=messages,
        )

        messages.append({"role": "assistant", "content": response.content})

        for block in response.content:
            if block.type == "text" and block.text.strip():
                log.info(f"CEO thought: {block.text[:300]}")

        if response.stop_reason == "end_turn":
            log.info("CEO completed (end_turn)")
            break

        if response.stop_reason != "tool_use":
            log.warning(f"Unexpected stop_reason: {response.stop_reason}")
            break

        tool_results = []
        for block in response.content:
            if block.type != "tool_use":
                continue

            log.info(f"CEO → {block.name}({json.dumps(block.input, default=str)[:120]})")

            if block.name == "send_ceo_briefing":
                briefing_sent = True

            if dry_run and block.name in ("run_product_scout", "run_social_hype"):
                result = f"[DRY RUN] Simulated {block.name} for {block.input.get('niche', '?')}"
            else:
                result = dispatch(block.name, block.input)

            log.info(f"  ↳ {str(result)[:200]}")
            tool_results.append({
                "type": "tool_result",
                "tool_use_id": block.id,
                "content": str(result),
            })

        messages.append({"role": "user", "content": tool_results})

    state["last_run"] = TODAY
    save_state(state)

    log.info(f"CEO run complete. Tasks: {_task_log}")
    print(f"\n{'=' * 50}")
    print(f"CEO daily run complete.")
    print(f"Tasks executed ({len(_task_log)}): {', '.join(_task_log) or 'none'}")
    print(f"User actions queued: {len(_queued_actions)}")
    print(f"Briefing: {ROOT}/reports/ceo_briefing_{TODAY}.txt")
    print(f"Log:      {ROOT}/logs/ceo_{TODAY}.log")
    print(f"{'=' * 50}\n")


# ── Entry point ────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="AI CEO — Autonomous Dropshipping Empire Manager")
    parser.add_argument("--dry-run", action="store_true", help="Plan only — simulate scouts and hype")
    parser.add_argument("--niche", choices=["pet", "auto"], help="Focus on one niche only")
    parser.add_argument("--brief-only", action="store_true", help="Send CEO briefing without execution")
    args = parser.parse_args()
    run_ceo(dry_run=args.dry_run, niche_filter=args.niche, brief_only=args.brief_only)
