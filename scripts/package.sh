#!/usr/bin/env bash
# Zip each plugin under plugins/ into dist/<name>.zip for upload in the Claude UI.
# ZIP root = plugin folder contents (.claude-plugin/plugin.json at the root).
# If the upload fails, test the layout with the "Use plugins in Claude" support page.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
for dir in plugins/*/; do
  name=$(basename "$dir")
  claude plugin validate "$dir"
  (cd "$dir" && zip -qr "../../dist/$name.zip" . -x '*.DS_Store')
done
echo "Created:"
ls -1 dist/*.zip
