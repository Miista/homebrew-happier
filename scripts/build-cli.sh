#!/usr/bin/env bash
# Build happier CLI binaries using the official release pipeline.
# Usage: build-cli.sh <happier-repo-dir> <out-dir>
set -euo pipefail

REPO_DIR="${1:?Usage: build-cli.sh <happier-repo-dir> <out-dir>}"
OUT_DIR="${2:?Usage: build-cli.sh <happier-repo-dir> <out-dir>}"

cd "$REPO_DIR"

echo "==> Installing dependencies"
bun install --ignore-scripts

echo "==> Building CLI binaries"
OUTPUT=$(node scripts/pipeline/release/build-cli-binaries.mjs)
echo "$OUTPUT"

# Copy artifacts to OUT_DIR
SRC_DIR=$(echo "$OUTPUT" | python3 -c "import json,sys; print(json.load(sys.stdin)['outDir'])")
mkdir -p "$OUT_DIR"
cp "$SRC_DIR"/happier-* "$OUT_DIR/"

echo "==> Done. Artifacts in $OUT_DIR:"
ls -lh "$OUT_DIR"/happier-*
