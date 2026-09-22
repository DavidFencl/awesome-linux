#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
mkdir -p "$BIN_DIR"
install -m 0755 "$ROOT/full-update" "$BIN_DIR/full-update"

BASHRC="${HOME}/.bashrc"
MARKER_BEGIN='# >>> awesome-linux fedora-full-update >>>'
MARKER_END='# <<< awesome-linux fedora-full-update <<<'

# Drop duplicate alias lines if present; prefer the PATH binary.
if [[ -f "$BASHRC" ]]; then
  tmp="$(mktemp)"
  grep -v -E "^[[:space:]]*alias full-update=" "$BASHRC" >"$tmp" || true
  mv "$tmp" "$BASHRC"
fi

if [[ -f "$BASHRC" ]] && ! grep -qF "$MARKER_BEGIN" "$BASHRC"; then
  {
    echo ""
    echo "$MARKER_BEGIN"
    echo "# full-update lives in ~/.local/bin (see awesome-linux/tools/fedora-full-update)"
    echo "$MARKER_END"
  } >>"$BASHRC"
fi

echo "Installed: $BIN_DIR/full-update"
echo "Run: full-update"
