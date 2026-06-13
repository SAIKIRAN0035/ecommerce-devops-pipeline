# Phase 1 — Planning & DevOps Goals

## Business context

Vaha Ruchulu is a homemade pickles and podis business. The website needed to:

- Accept orders 24/7 without a developer on call
- Deploy safely after every change
- Store orders and reviews reliably
- Alert the owner when new orders arrive

## DevOps goals

| Goal | Success metric |
|------|----------------|
| Repeatable deploys | `git push` → live site in &lt; 3 minutes |
| Catch build breaks early | CI fails before production deploy |
| Documented secrets | No passwords in git |
| Health verification | Script confirms site + APIs respond |
| Rollback path | Redeploy previous Vercel deployment |

## Constraints

- **Hobby Vercel plan** — max 12 serverless functions (moved `api/lib` → `server/lib`)
- **No dedicated server** — serverless + Blob only
- **Solo maintainer** — automation must be simple

## Decisions made

1. **Vercel** for hosting (React static + API routes in one repo)
2. **GitHub** for source control and CI
3. **Vercel Blob** instead of self-hosted database (cost + simplicity)
4. **Optional** Gmail + Telegram for alerts (not blocking deploy)

## Deliverables from this phase

- [x] Deployment checklist
- [x] Environment variable inventory
- [x] Branch strategy: `main` = production
- [x] This documentation repository

## Next

→ [02-repository-setup.md](02-repository-setup.md)
