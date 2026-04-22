# Crontab Configuration

Run `crontab -e` and paste the following block.

```cron
# ── Environment ────────────────────────────────────────────────────────────────
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
TZ=Australia/Sydney

# ── Dropshipping Empire — Master Sequence ──────────────────────────────────────
# Phase 1-3: Scout + Hype + Sync — 04:00 AEST daily
0 4 * * * /bin/bash /home/dsights/claude/DROPSHIPPING/master.sh >> /home/dsights/claude/DROPSHIPPING/logs/cron_master.log 2>&1

# Phase 4: CEO Report — 08:45 AEST (gives WooCommerce time to record sales)
45 8 * * * /home/dsights/claude/DROPSHIPPING/venv/bin/python3 /home/dsights/claude/DROPSHIPPING/_common/report.py >> /home/dsights/claude/DROPSHIPPING/logs/cron_report.log 2>&1

# ── Weekly: Rotate old logs (keep 30 days) ────────────────────────────────────
0 3 * * 0 find /home/dsights/claude/DROPSHIPPING/logs -name "*.log" -mtime +30 -delete

# ── Weekly: Rotate old DB exports (keep 14 days) ─────────────────────────────
0 3 * * 0 find /home/dsights/claude/DROPSHIPPING/db -name "*.sql" -mtime +14 -delete
```

## How to install

```bash
# Open the crontab editor
crontab -e

# Verify it was saved
crontab -l

# Test the master script manually (dry-run check)
bash /home/dsights/claude/DROPSHIPPING/master.sh
```

## Cron timing reference (AEST = UTC+10/+11)

| Job            | AEST   | UTC (AEDT) | Description                     |
|----------------|--------|------------|---------------------------------|
| Master Sequence| 04:00  | 17:00 prev | Scout → Hype → Sync             |
| CEO Report     | 08:45  | 21:45 prev | Aggregate stats + send Telegram |
| Log cleanup    | 03:00  | 16:00 prev | Sunday, remove old files        |

## Verify TZ setting works

```bash
# Check cron sees the right timezone
TZ=Australia/Sydney date
```
