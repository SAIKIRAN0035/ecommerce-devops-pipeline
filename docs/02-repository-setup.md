# Phase 2 — Repository & Branch Setup

## Initial problem

The app lived only on a local Mac folder. GitHub and Vercel were not connected at first.

## What I did

### Step 1 — Initialize git in project root

```bash
cd ~/vaha-ruchulu
git init
git branch -M main
```

### Step 2 — `.gitignore` (critical)

```
node_modules
dist
.env
.env.local
.vercel
!.env.example
```

Never commit `.env.local` — it contains owner password and Blob tokens.

### Step 3 — Create GitHub repository

```bash
gh repo create e-commerce-website --public --source=. --push
```

### Step 4 — Branch strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production — always deployable |
| `feature/*` | Optional — new features before merge |

For a solo project, most work goes directly to `main` after local testing.

### Step 5 — Link Vercel to Git (recommended)

Vercel Dashboard → Project → **Settings → Git** → Connect `e-commerce-website`

After connection, every push to `main` triggers automatic production deploy.

## Folder structure for serverless limit

```
vaha-ruchulu/
├── api/              # Only route handlers (counts toward 12-function limit)
├── server/lib/       # Shared code — NOT under api/
├── src/              # React frontend
├── public/           # Product images
└── vercel.json       # SPA rewrites
```

**Lesson:** Any `.js` file under `api/` becomes a serverless function on Vercel Hobby.

## Next

→ [03-ci-pipeline.md](03-ci-pipeline.md)
