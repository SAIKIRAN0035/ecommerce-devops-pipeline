# Phase 6 — Monitoring & Alerts

## Health check script

Run after every deploy:

```bash
./scripts/health-check.sh
```

Checks:

- `GET /` → 200
- `GET /api/products` → 200 + JSON
- `GET /api/reviews` → 200

## Order notifications

When a customer places an order (`POST /api/orders`):

| Channel | Status | Setup |
|---------|--------|-------|
| WhatsApp | Always | Customer opens wa.me link |
| Email | Optional | Gmail App Password |
| Telegram | Optional | Bot token + chat ID |

Email uses 4-second timeout so slow SMTP does not block order save.

## Vercel dashboard

- **Deployments** — build logs, errors
- **Functions** — API latency and 5xx errors
- **Analytics** — traffic (if enabled)

## What to monitor weekly

- [ ] Site loads on mobile
- [ ] Place test order → appears in owner dashboard
- [ ] Blob storage connected
- [ ] Custom domain DNS (if using)

## Uptime (free options)

- [UptimeRobot](https://uptimerobot.com) — ping homepage every 5 min
- GitHub Actions scheduled workflow — run `health-check.sh` daily

## Next

→ [07-rollback-troubleshooting.md](07-rollback-troubleshooting.md)
