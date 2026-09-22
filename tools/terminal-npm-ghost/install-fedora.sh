#!/usr/bin/env bash
# Install terminal-npm-ghost on Fedora for Ptyxis.
set -euo pipefail

CONF_DIR="${HOME}/.config/fish/conf.d"
SNIPPET="${CONF_DIR}/awesome-linux-npm-ghost.fish"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> terminal-npm-ghost (Fedora / Ptyxis)"

if ! command -v fish >/dev/null 2>&1; then
  echo "==> Installing fish via dnf (sudo required)"
  sudo dnf install -y fish
else
  echo "==> fish already present: $(command -v fish) ($(fish --version 2>/dev/null || true))"
fi

mkdir -p "${CONF_DIR}"
cp "${SCRIPT_DIR}/snippets/config.fish" "${SNIPPET}"
echo "==> Wrote ${SNIPPET}"

if [[ -f /usr/share/fish/completions/npm.fish ]]; then
  echo "==> Found fish npm completions: /usr/share/fish/completions/npm.fish"
else
  echo "==> WARN: /usr/share/fish/completions/npm.fish missing — Tab may not complete scripts"
fi

echo
echo "==> Ptyxis: set Custom command to: fish"
echo "    Preferences → your profile → Command → Custom command"
echo "    Or: open a one-off window with:  ptyxis --new-window -x fish"
echo
echo "==> New terminal window required. Ghost accept = Right Arrow. npm scripts = Tab after 'npm run '."
echo "==> Done. To reverse: clear Ptyxis custom command; rm ${SNIPPET}"
