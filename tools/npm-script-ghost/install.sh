#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLE_HOME="${HOME}/.local/share/blesh"
BLESH_URL="https://github.com/akinomyoga/ble.sh.git"
MARKER_BEGIN='# >>> awesome-linux npm-script-ghost >>>'
MARKER_END='# <<< awesome-linux npm-script-ghost <<<'
BASHRC="${HOME}/.bashrc"

echo "==> installing ble.sh (bash line editor + ghost autosuggestions)"
if [[ ! -f "$BLE_HOME/ble.sh" ]]; then
  mkdir -p "$(dirname "$BLE_HOME")"
  if [[ -d "$BLE_HOME/.git" ]]; then
    git -C "$BLE_HOME" pull --ff-only
  else
    rm -rf "$BLE_HOME"
    git clone --recursive --depth 1 "$BLESH_URL" "$BLE_HOME"
  fi
  # build attach script if Makefile present
  if [[ -f "$BLE_HOME/Makefile" ]]; then
    make -C "$BLE_HOME" 2>/dev/null || true
  fi
else
  echo "    ble.sh already present at $BLE_HOME"
fi

mkdir -p "${HOME}/.config/awesome-linux/npm-script-ghost"
install -m 0644 "$ROOT/bash/npm-run-scripts.bash" \
  "${HOME}/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash"
install -m 0644 "$ROOT/bash/ble-npm-ghost.bash" \
  "${HOME}/.config/awesome-linux/npm-script-ghost/ble-npm-ghost.bash"

# Insert bashrc block at the TOP for ble.sh (must load early), if missing.
if ! grep -qF "$MARKER_BEGIN" "$BASHRC" 2>/dev/null; then
  block=$(cat <<BLOCK
$MARKER_BEGIN
# ble.sh must be sourced near the top of .bashrc (interactive shells only)
if [[ \$- == *i* ]]; then
  [[ -f "\$HOME/.local/share/blesh/ble.sh" ]] && source "\$HOME/.local/share/blesh/ble.sh" --attach=prompt
  [[ -f "\$HOME/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash" ]] && \
    source "\$HOME/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash"
  [[ -f "\$HOME/.config/awesome-linux/npm-script-ghost/ble-npm-ghost.bash" ]] && \
    source "\$HOME/.config/awesome-linux/npm-script-ghost/ble-npm-ghost.bash"
fi
$MARKER_END

BLOCK
)
  tmp="$(mktemp)"
  {
    # After the usual "source /etc/bashrc" block if present, else at top
    if grep -q 'Source global definitions' "$BASHRC" 2>/dev/null; then
      awk -v block="$block" '
        BEGIN { printed=0 }
        { print }
        /\/etc\/bashrc/ && !printed {
          # print following "fi" then inject — simpler: inject after first fi following etc/bashrc
        }
      ' "$BASHRC" >"$tmp"
      # Simpler approach: prepend after shebang-less file start using python
      rm -f "$tmp"
      python3 - <<'PY' "$BASHRC" "$block"
import sys
path, block = sys.argv[1], sys.argv[2]
text = open(path).read()
needle = "if [ -f /etc/bashrc ]; then\n    . /etc/bashrc\nfi\n"
if needle in text and block.strip() not in text:
    text = text.replace(needle, needle + "\n" + block, 1)
else:
    text = block + "\n" + text
open(path, "w").write(text)
PY
    else
      printf '%s\n%s\n' "$block" "$(cat "$BASHRC" 2>/dev/null || true)" >"$tmp"
      mv "$tmp" "$BASHRC"
    fi
  }
  echo "==> updated $BASHRC"
else
  echo "==> bashrc marker already present"
fi

echo
echo "Installed npm-script-ghost."
echo "Open a new Ptyxis tab (or: source ~/.bashrc) then try:"
echo "  cd <project-with-package.json>"
echo "  npm run <prefix>     # ghost text shows the completion; Tab accepts it"
