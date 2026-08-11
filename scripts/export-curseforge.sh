#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v packwiz >/dev/null 2>&1; then
  echo "ERROR: packwiz not found. Install: go install github.com/packwiz/packwiz@latest"
  exit 1
fi

mkdir -p exports
OUTPUT="${1:-exports/SkyblockProgression-curseforge.zip}"

echo "==> packwiz refresh"
packwiz refresh

echo "==> exporting $OUTPUT"
packwiz curseforge export -o "$OUTPUT"
ls -lh "$OUTPUT"
echo "Import this zip in CurseForge App."
