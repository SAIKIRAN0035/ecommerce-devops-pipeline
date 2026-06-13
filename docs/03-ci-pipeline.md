# Phase 3 — CI Pipeline (GitHub Actions)

## Objective

Run **lint** and **build** on every push so broken code never reaches production unnoticed.

## Workflow file

See [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) in this repository.

## What the pipeline does

1. Checkout code
2. `npm ci` — clean install from lockfile
3. `npm run build` — Vite production build
4. Fail the job if build errors

## Setup steps I followed

### 1. Add workflow to application repo

Copy `ci.yml` into `e-commerce-website/.github/workflows/` or run CI from this DevOps repo using `workflow_dispatch`.

### 2. Enable Actions

GitHub → Repository → **Actions** → Enable workflows

### 3. First run

```bash
git add .github/workflows/ci.yml
git commit -m "Add CI build workflow"
git push origin main
```

GitHub Actions tab shows green ✓ or red ✗.

## Local parity before push

```bash
npm run build
```

Same command CI runs — if it passes locally, CI should pass.

## ESLint (optional gate)

```bash
npm run lint
```

Can add lint step to CI when rules are stable.

## CI badge (README)

```markdown
![CI](https://github.com/SAIKIRAN0035/e-commerce-website/actions/workflows/ci.yml/badge.svg)
```

## Troubleshooting

| Error | Fix |
|-------|-----|
| `npm ci` fails | Commit `package-lock.json` |
| Build OOM on GitHub | Reduce bundle size, check imports |
| Wrong Node version | Set `node-version: '20'` in workflow |

## Next

→ [04-cd-vercel.md](04-cd-vercel.md)
