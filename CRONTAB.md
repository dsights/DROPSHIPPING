# Crontab Configuration

Run `crontab -e` and paste the following block.

```cron
# ── Environment ────────────────────────────────────────────────────────────────
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
TZ=Australia/Sydney

# ── Dropshipping Empire — AI CEO (replaces master.sh + report.py) ─────────────
# Full autonomous CEO run: competitor analysis, scout, hype, pricing, SEO, briefing
0 4 * * * /bin/bash /home/dsights/claude/DROPSHIPPING/ceo.sh >> /home/dsights/claude/DROPSHIPPING/logs/cron_ceo.log 2>&1

# Legacy: operational-only master run (fallback if CEO agent is disabled)
# 0 4 * * * /bin/bash /home/dsights/claude/DROPSHIPPING/master.sh >> /home/dsights/claude/DROPSHIPPING/logs/cron_master.log 2>&1

# Sync to FastComet — 06:00 AEST (after CEO run completes)
0 6 * * * /bin/bash /home/dsights/claude/DROPSHIPPING/_common/sync.sh >> /home/dsights/claude/DROPSHIPPING/logs/cron_sync.log 2>&1

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

| Job           | AEST  | UTC (AEDT) | Description                                       |
|---------------|-------|------------|---------------------------------------------------|
| AI CEO        | 04:00 | 17:00 prev | Competitor intel → Scout → Hype → SEO → Briefing  |
| Sync          | 06:00 | 19:00 prev | Git push + rsync to FastComet                     |
| Log cleanup   | 03:00 | 16:00 prev | Sunday, remove files older than 30 days           |

## Verify TZ setting works

```bash
# Check cron sees the right timezone
TZ=Australia/Sydney date
```
