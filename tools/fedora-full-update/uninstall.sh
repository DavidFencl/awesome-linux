#!/usr/bin/env bash
set -euo pipefail
BIN="${HOME}/.local/bin/full-update"
BASHRC="${HOME}/.bashrc"
MARKER_BEGIN='# >>> awesome-linux fedora-full-update >>>'
MARKER_END='# <<< awesome-linux fedora-full-update <<<'

[[ -f "$BIN" ]] && rm -f "$BIN" && echo "Removed $BIN" || echo "No $BIN"

if [[ -f "$BASHRC" ]]; then
  python3 - <<'PY' "$BASHRC" "$MARKER_BEGIN" "$MARKER_END"
import sys, re
path, begin, end = sys.argv[1:4]
text = open(path).read()
text2 = re.sub(re.escape(begin) + r".*?" + re.escape(end) + r"\n?", "", text, flags=re.S)
if text2 != text:
    open(path, "w").write(text2)
    print(f"Removed marker block from {path}")
else:
    print("No marker block in bashrc")
PY
fi
echo "Done."
