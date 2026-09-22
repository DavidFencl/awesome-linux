#!/usr/bin/env bash
set -euo pipefail
SNIPPET="${HOME}/.config/fish/conf.d/awesome-linux-npm-ghost.fish"
THEME="${HOME}/.config/fish/conf.d/awesome-linux-fedora-dark.fish"
if [[ -f "${SNIPPET}" ]]; then
  rm -f "${SNIPPET}"
  echo "Removed ${SNIPPET}"
else
  echo "No snippet at ${SNIPPET}"
fi
if [[ -f "${THEME}" ]]; then
  rm -f "${THEME}"
  echo "Removed ${THEME}"
fi
echo "Also clear Ptyxis profile Custom command (back to default/bash)."
echo "Optional: sudo dnf remove fish"
