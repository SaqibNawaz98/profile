#!/usr/bin/env bash
# Saves raw HTML from the deployed Weebly site for reference when rebuilding.
# Re-run after the live site changes. Does not replace your hand-built static files.

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/reference/live-html"
BASE="https://www.sophiaseptien.com"

mkdir -p "$OUT"

echo "Fetching $BASE/ ..."
curl -sL "$BASE/" -o "$OUT/index.html"

pages=(
  anatomical-drawing
  illustration
  sculpture
  arts--crafts
  painting
  3d-and-graphic-design
  ceramics
  photography
)

for p in "${pages[@]}"; do
  echo "Fetching $BASE/${p}.html ..."
  curl -sL "$BASE/${p}.html" -o "$OUT/${p}.html"
done

echo "Done. HTML under: $OUT"
wc -c "$OUT"/*.html | tail -1
