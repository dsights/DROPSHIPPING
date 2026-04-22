"""SQLite database layer — shared across all agents."""
import sqlite3
import json
from pathlib import Path
from datetime import date


def get_wp_url(niche_cfg: dict, global_cfg: dict) -> str:
    """Return local or live WordPress URL based on local_mode flag."""
    if global_cfg.get("local_mode", False):
        return niche_cfg["wp_url_local"]
    return niche_cfg["wp_url_live"]


def get_conn(db_path: str) -> sqlite3.Connection:
    Path(db_path).parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    _bootstrap(conn)
    return conn


def _bootstrap(conn: sqlite3.Connection):
    conn.executescript("""
        CREATE TABLE IF NOT EXISTS products (
            id              INTEGER PRIMARY KEY AUTOINCREMENT,
            niche           TEXT NOT NULL,
            supplier_url    TEXT,
            supplier_price  REAL,
            sale_price      REAL,
            margin_pct      REAL,
            title           TEXT,
            description     TEXT,
            blog_post       TEXT,
            image_urls      TEXT,   -- JSON array
            woo_product_id  INTEGER,
            woo_post_id     INTEGER,
            status          TEXT DEFAULT 'pending',  -- pending|published|rejected
            created_at      TEXT DEFAULT (date('now')),
            updated_at      TEXT DEFAULT (date('now'))
        );

        CREATE TABLE IF NOT EXISTS social_posts (
            id          INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id  INTEGER REFERENCES products(id),
            niche       TEXT,
            platform    TEXT,   -- tiktok|instagram|pinterest
            content     TEXT,
            mixpost_id  TEXT,
            scheduled_at TEXT,
            status      TEXT DEFAULT 'queued',
            created_at  TEXT DEFAULT (date('now'))
        );

        CREATE TABLE IF NOT EXISTS daily_reports (
            id              INTEGER PRIMARY KEY AUTOINCREMENT,
            report_date     TEXT DEFAULT (date('now')),
            niche           TEXT,
            products_added  INTEGER DEFAULT 0,
            blogs_posted    INTEGER DEFAULT 0,
            social_queued   INTEGER DEFAULT 0,
            woo_revenue_aud REAL DEFAULT 0,
            woo_orders      INTEGER DEFAULT 0,
            report_json     TEXT,
            sent_at         TEXT
        );
    """)
    conn.commit()


def insert_product(conn, niche: str, data: dict) -> int:
    cur = conn.execute("""
        INSERT INTO products (niche, supplier_url, supplier_price, sale_price,
            margin_pct, title, description, blog_post, image_urls, status)
        VALUES (:niche, :supplier_url, :supplier_price, :sale_price,
            :margin_pct, :title, :description, :blog_post, :image_urls, :status)
    """, {**data, "niche": niche})
    conn.commit()
    return cur.lastrowid


def get_todays_products(conn, niche: str) -> list:
    return conn.execute(
        "SELECT * FROM products WHERE niche=? AND created_at=? AND status!='rejected'",
        (niche, str(date.today()))
    ).fetchall()


def update_product_status(conn, product_id: int, status: str, woo_product_id=None, woo_post_id=None):
    conn.execute("""
        UPDATE products SET status=?, woo_product_id=?, woo_post_id=?, updated_at=date('now')
        WHERE id=?
    """, (status, woo_product_id, woo_post_id, product_id))
    conn.commit()


def insert_social_post(conn, data: dict) -> int:
    cur = conn.execute("""
        INSERT INTO social_posts (product_id, niche, platform, content, mixpost_id, scheduled_at, status)
        VALUES (:product_id, :niche, :platform, :content, :mixpost_id, :scheduled_at, :status)
    """, data)
    conn.commit()
    return cur.lastrowid


def api_url(base_url: str, route: str) -> str:
    """Build WC REST API URL using ?rest_route= fallback (no Apache rewrite needed locally)."""
    return f"{base_url}/index.php?rest_route={route}"
