# bash completion: npm run <script> from nearest package.json
# Used with ble.sh auto_complete for ghost suggestions.

_awesome_linux_npm_package_scripts() {
  local dir="$PWD"
  local pkg=""
  while [[ -n "$dir" ]]; do
    if [[ -f "$dir/package.json" ]]; then
      pkg="$dir/package.json"
      break
    fi
    [[ "$dir" == "/" ]] && break
    dir="$(dirname "$dir")"
  done
  [[ -z "$pkg" ]] && return 0

  # Prefer node for robust JSON; fall back to a light sed scrape.
  if command -v node >/dev/null 2>&1; then
    node -e '
      const fs = require("fs");
      const p = process.argv[1];
      try {
        const j = JSON.parse(fs.readFileSync(p, "utf8"));
        const s = j.scripts || {};
        process.stdout.write(Object.keys(s).join("\n"));
      } catch (_) {}
    ' "$pkg"
  else
    # crude fallback: keys under "scripts" { ... }
    awk '
      /"scripts"[[:space:]]*:/ { in_scripts=1; next }
      in_scripts && /^[[:space:]]*}/ { exit }
      in_scripts && match($0, /"([^"]+)"[[:space:]]*:/, m) { print m[1] }
    ' "$pkg" 2>/dev/null || true
  fi
}

_awesome_linux_npm_run_complete() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local prev="${COMP_WORDS[COMP_CWORD-1]}"
  local cmd="${COMP_WORDS[0]}"

  # Only enhance: npm run <tab> / npm run-script <tab>
  if [[ "$cmd" != "npm" ]]; then
    return 0
  fi

  if [[ "$prev" == "run" || "$prev" == "run-script" ]]; then
    local scripts
    scripts="$(_awesome_linux_npm_package_scripts)"
    if [[ -n "$scripts" ]]; then
      COMPREPLY=( $(compgen -W "$scripts" -- "$cur") )
      return 0
    fi
  fi

  # npm <tab> when typing "run..."
  if [[ "$COMP_CWORD" -eq 1 ]]; then
    return 0
  fi
}

# Prepend our completer without wiping npm's own completion if present.
if declare -F _npm_completion >/dev/null 2>&1; then
  _awesome_linux_npm_completion_wrap() {
    _npm_completion "$@"
    # If npm left empty replies on `npm run`, fill from package.json
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    if [[ ${#COMPREPLY[@]} -eq 0 && ( "$prev" == "run" || "$prev" == "run-script" ) ]]; then
      _awesome_linux_npm_run_complete
    elif [[ "$prev" == "run" || "$prev" == "run-script" ]]; then
      # Prefer package.json scripts; merge unique
      local existing=("${COMPREPLY[@]}")
      _awesome_linux_npm_run_complete
      local merged
      merged=$(printf '%s\n' "${existing[@]}" "${COMPREPLY[@]}" | awk 'NF && !seen[$0]++')
      COMPREPLY=( $(compgen -W "$merged" -- "${COMP_WORDS[COMP_CWORD]}") )
    fi
  }
  complete -F _awesome_linux_npm_completion_wrap npm
else
  complete -F _awesome_linux_npm_run_complete npm
fi
