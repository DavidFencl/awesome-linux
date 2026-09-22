#!/usr/bin/env bash
set -euo pipefail
BASHRC="${HOME}/.bashrc"
BLERC="${HOME}/.blerc"
CFG="${HOME}/.config/awesome-linux/npm-script-ghost"
MARKER_BEGIN='# >>> awesome-linux npm-script-ghost >>>'
MARKER_END='# <<< awesome-linux npm-script-ghost <<<'
BLERC_BEGIN='# >>> awesome-linux ble-fedora-dark >>>'
BLERC_END='# <<< awesome-linux ble-fedora-dark <<<'

strip_markers() {
  local file="$1" begin="$2" end="$3"
  [[ -f "$file" ]] || return 0
  python3 - <<'PY' "$file" "$begin" "$end"
import sys, re
path, begin, end = sys.argv[1:4]
text = open(path).read()
text2 = re.sub(re.escape(begin) + r".*?" + re.escape(end) + r"\n?", "", text, flags=re.S)
if text2 != text:
    open(path, "w").write(text2)
    print(f"Stripped markers from {path}")
else:
    print(f"No markers in {path}")
PY
}

strip_markers "$BASHRC" "$MARKER_BEGIN" "$MARKER_END"
strip_markers "$BLERC" "$BLERC_BEGIN" "$BLERC_END"
if [[ -d "$CFG" ]]; then
  rm -rf "$CFG"
  echo "Removed $CFG"
fi
echo "Left ~/.local/share/blesh in place (shared). Delete manually if unused:"
echo "  rm -rf ~/.local/share/blesh"
echo "Open a new terminal tab after uninstall."
