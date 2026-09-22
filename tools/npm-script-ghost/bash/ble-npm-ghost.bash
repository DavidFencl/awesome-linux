# ble.sh hooks: ghost text shows what Tab would complete (including npm run scripts).
# Requires ble.sh already loaded.

bleopt complete_auto_complete=on 2>/dev/null || true
# Dim ghost suggestion; adjust if your theme clashes
ble-face auto_complete+='fg=242' 2>/dev/null || true
