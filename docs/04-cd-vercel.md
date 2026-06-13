# Phase 4 — CD with Vercel

## Deployment options used

| Method | When |
|--------|------|
| `npx vercel --prod` | Manual deploy from Mac (first go-live) |
| Git push → Vercel | Automatic after Git integration |

## First production deploy (manual)

```bash
cd ~/vaha-ruchulu
npm run build
npx vercel login
npx vercel --prod
```

Output:

```
▲ Production  https://vaha-ruchulu.vercel.app
▲ Aliased     https://vaharuchulu.com
```

## Environment variables (Vercel Dashboard)

**Settings → Environment Variables** — set for Production, Preview, Development:

| Variable | Purpose |
|----------|---------|
| `BLOB_READ_WRITE_TOKEN` | Reviews, orders, products storage |
| `REVIEWS_ADMIN_PASSWORD` | Owner dashboard login |
| `GMAIL_USER` | Order email alerts |
| `GMAIL_APP_PASSWORD` | Gmail App Password (16 chars) |
| `OWNER_EMAIL` | Where alerts go |
| `TELEGRAM_BOT_TOKEN` | Optional instant alerts |
| `TELEGRAM_OWNER_CHAT_ID` | Your Telegram chat ID |
| `VITE_SITE_URL` | Canonical site URL |

Redeploy after adding variables.

## Custom domain

1. Vercel → **Domains** → Add `vaharuchulu.com`
2. At domain registrar, add DNS A records → `76.76.21.21`
3. Wait for SSL certificate (up to 48 hours)

## Deploy script

See [`scripts/deploy-vercel.sh`](../scripts/deploy-vercel.sh)

## Preview deployments

Every PR (if using branches) gets a preview URL from Vercel — test before merging to `main`.

## Next

→ [05-secrets-and-env.md](05-secrets-and-env.md)
