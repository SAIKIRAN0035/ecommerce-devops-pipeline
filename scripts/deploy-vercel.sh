#!/usr/bin/env bash
set -euo pipefail

echo "Building..."
npm run build

echo "Deploying to Vercel production..."
npx vercel --prod

echo "Running health check..."
./scripts/health-check.sh

echo "Deploy complete."
