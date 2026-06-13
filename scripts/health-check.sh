#!/usr/bin/env bash
set -euo pipefail

SITE="${SITE_URL:-https://vaha-ruchulu.vercel.app}"

echo "Checking $SITE ..."

code=$(curl -sS -o /dev/null -w "%{http_code}" "$SITE/")
[[ "$code" == "200" ]] || { echo "FAIL homepage: $code"; exit 1; }
echo "OK  homepage ($code)"

code=$(curl -sS -o /dev/null -w "%{http_code}" "$SITE/api/products")
[[ "$code" == "200" ]] || { echo "FAIL /api/products: $code"; exit 1; }
echo "OK  /api/products ($code)"

code=$(curl -sS -o /dev/null -w "%{http_code}" "$SITE/api/reviews")
[[ "$code" == "200" ]] || { echo "FAIL /api/reviews: $code"; exit 1; }
echo "OK  /api/reviews ($code)"

echo "All health checks passed."
