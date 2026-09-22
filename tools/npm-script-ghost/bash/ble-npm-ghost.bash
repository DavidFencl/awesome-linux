# ble.sh hooks for npm-script-ghost + Fedora-dark faces
# Requires ble.sh already loaded.

bleopt complete_auto_complete=on 2>/dev/null || true

_theme="$HOME/.config/awesome-linux/npm-script-ghost/ble-fedora-dark.bash"
if [[ -f "$_theme" ]]; then
  # shellcheck disable=SC1090
  source "$_theme"
else
  ble-face auto_complete+='fg=244' 2>/dev/null || true
fi
unset _theme
