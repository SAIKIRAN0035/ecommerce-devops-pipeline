# Phase 5 — Secrets & Environments

## Golden rules

1. **Never** commit secrets to git
2. Use `.env.example` with placeholder values only
3. Production secrets live in **Vercel** only
4. Rotate owner password if exposed

## Secret inventory

### Server-only (no `VITE_` prefix)

| Secret | Risk if leaked |
|--------|----------------|
| `REVIEWS_ADMIN_PASSWORD` | Full owner dashboard access |
| `BLOB_READ_WRITE_TOKEN` | Read/write all customer data |
| `GMAIL_APP_PASSWORD` | Send email as your Gmail |
| `TELEGRAM_BOT_TOKEN` | Post to your bot |

### Client-safe

| Variable | Notes |
|----------|-------|
| `VITE_SITE_URL` | Public URL — safe to expose |

## Local development

```bash
cp .env.example .env.local
# Fill in values for local testing
npx vercel dev   # Runs APIs + frontend
```

`npm run dev` alone does **not** run API routes — use `vercel dev` for owner/inventory testing.

## Gmail App Password

Regular Gmail password **does not work** for SMTP.

1. Google Account → Security → 2-Step Verification ON
2. App passwords → Generate 16-character password
3. Set as `GMAIL_APP_PASSWORD` in Vercel

## Admin auth model

- Owner logs in via `/api/admin/session`
- Password stored in sessionStorage as Bearer token
- APIs validate with `REVIEWS_ADMIN_PASSWORD`

**Improvement for future:** JWT with expiry instead of raw password token.

## Next

→ [06-monitoring-alerts.md](06-monitoring-alerts.md)
