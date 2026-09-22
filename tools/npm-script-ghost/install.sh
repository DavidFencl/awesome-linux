#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLE_HOME="${HOME}/.local/share/blesh"
BLE_SH="${BLE_HOME}/out/ble.sh"
BLESH_URL="https://github.com/akinomyoga/ble.sh.git"
MARKER_BEGIN='# >>> awesome-linux npm-script-ghost >>>'
MARKER_END='# <<< awesome-linux npm-script-ghost <<<'
BASHRC="${HOME}/.bashrc"

echo "==> installing ble.sh (bash line editor + ghost autosuggestions)"
if [[ ! -f "$BLE_SH" ]]; then
  mkdir -p "$(dirname "$BLE_HOME")"
  if [[ -d "$BLE_HOME/.git" ]]; then
    git -C "$BLE_HOME" pull --ff-only
  else
    rm -rf "$BLE_HOME"
    git clone --recursive --depth 1 "$BLESH_URL" "$BLE_HOME"
  fi
  make -C "$BLE_HOME"
else
  echo "    ble.sh already present at $BLE_SH"
fi

mkdir -p "${HOME}/.config/awesome-linux/npm-script-ghost"
install -m 0644 "$ROOT/bash/npm-run-scripts.bash" \
  "${HOME}/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash"
install -m 0644 "$ROOT/bash/ble-npm-ghost.bash" \
  "${HOME}/.config/awesome-linux/npm-script-ghost/ble-npm-ghost.bash"
install -m 0644 "$ROOT/bash/ble-fedora-dark.bash" \
  "${HOME}/.config/awesome-linux/npm-script-ghost/ble-fedora-dark.bash"

block=$(cat <<BLOCK
$MARKER_BEGIN
# ble.sh must be sourced near the top of .bashrc (interactive shells only)
if [[ \$- == *i* ]]; then
  [[ -f "\$HOME/.local/share/blesh/out/ble.sh" ]] && source "\$HOME/.local/share/blesh/out/ble.sh" --attach=prompt
  [[ -f "\$HOME/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash" ]] && \\
    source "\$HOME/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash"
  [[ -f "\$HOME/.config/awesome-linux/npm-script-ghost/ble-npm-ghost.bash" ]] && \\
    source "\$HOME/.config/awesome-linux/npm-script-ghost/ble-npm-ghost.bash"
fi
$MARKER_END
BLOCK
)

python3 - <<'PY' "$BASHRC" "$block" "$MARKER_BEGIN" "$MARKER_END"
import sys, re
path, block, begin, end = sys.argv[1:5]
text = open(path).read() if __import__("os").path.exists(path) else ""
# strip existing marker block
pattern = re.compile(re.escape(begin) + r".*?" + re.escape(end) + r"\n?", re.S)
text = pattern.sub("", text)
needle = "if [ -f /etc/bashrc ]; then\n    . /etc/bashrc\nfi\n"
if needle in text:
    text = text.replace(needle, needle + "\n" + block + "\n", 1)
else:
    text = block + "\n" + text
open(path, "w").write(text)
print(f"==> updated {path}")
PY

echo
echo "Installed npm-script-ghost."
echo "Open a new Ptyxis tab (or: source ~/.bashrc) then try:"
echo "  cd <project-with-package.json>"
echo "  npm run <prefix>     # ghost text shows the completion; Tab accepts it"
