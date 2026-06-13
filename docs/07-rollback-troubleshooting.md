# Phase 7 — Rollback & Troubleshooting

## Rollback on Vercel

1. Vercel Dashboard → **Deployments**
2. Find last working deployment
3. Click **⋯** → **Promote to Production**

Instant rollback without git revert.

## Git rollback (if needed)

```bash
git revert HEAD
git push origin main
```

Triggers new deploy with previous code state.

## Incidents solved during this project

### 1. "No more than 12 Serverless Functions"

**Cause:** Helper files inside `api/lib/` counted as functions.

**Fix:** Move shared code to `server/lib/` outside `api/`.

### 2. Orders API 500 error

**Cause:** Email SMTP timeout + private blob reads.

**Fix:** Public blob pattern, dynamic email import, 4s timeout.

### 3. Custom domain "can't connect"

**Cause:** DNS not configured at registrar.

**Fix:** A records `@` and `www` → `76.76.21.21`.

### 4. Gmail alerts not sending

**Cause:** Used regular password instead of App Password.

**Fix:** Google App Password in Vercel env.

## Runbook: site down

1. Run `./scripts/health-check.sh`
2. Check Vercel status page
3. Read latest deployment build log
4. Promote previous deployment if recent change broke site
5. Check env vars not deleted

## Runbook: owner cannot login

1. Verify `REVIEWS_ADMIN_PASSWORD` in Vercel
2. Redeploy after env change
3. Clear browser sessionStorage
4. Use forgot-password flow (needs Gmail App Password)

## Project complete checklist

- [x] CI builds on push
- [x] Production on Vercel
- [x] Blob storage for data
- [x] Health check script
- [x] Documented secrets
- [x] Rollback procedure
- [ ] Custom domain DNS (user registrar step)
- [ ] Gmail App Password for email alerts

---

**Related:** [Website build docs](https://github.com/SAIKIRAN0035/ecommerce-website-build)
