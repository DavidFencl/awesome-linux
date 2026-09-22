#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
mkdir -p "$BIN_DIR"
install -m 0755 "$ROOT/full-update" "$BIN_DIR/full-update"

BASHRC="${HOME}/.bashrc"
MARKER_BEGIN='# >>> awesome-linux fedora-full-update >>>'
MARKER_END='# <<< awesome-linux fedora-full-update <<<'

if [[ -f "$BASHRC" ]]; then
  python3 - <<'PY' "$BASHRC" "$MARKER_BEGIN" "$MARKER_END"
import sys, re
path, begin, end = sys.argv[1:4]
text = open(path).read()
# remove alias full-update lines
text = re.sub(r"(?m)^[ \t]*alias full-update=.*\n?", "", text)
# refresh marker block
pattern = re.compile(re.escape(begin) + r".*?" + re.escape(end) + r"\n?", re.S)
text = pattern.sub("", text)
block = f"""{begin}
# full-update lives in ~/.local/bin (see awesome-linux/tools/fedora-full-update)
{end}
"""
if not text.endswith("\n"):
    text += "\n"
text += "\n" + block
open(path, "w").write(text)
print(f"==> cleaned aliases / markers in {path}")
PY
fi

echo "Installed: $BIN_DIR/full-update"
echo "Run: full-update"
