# npm-script-ghost

bash + [ble.sh](https://github.com/akinomyoga/ble.sh): ghost autofill for Tab completion, plus `npm run <script>` from nearest `package.json`. Includes Adwaita Dark–quiet ble faces.

## Agent runbook

### Preconditions

- Fedora desktop, **bash** (user may use Ptyxis)
- `git`, `make`, `gawk` for ble.sh build
- `node` recommended for JSON script parsing
- **Do not** source fish theme files from bash

### Install

```bash
cd tools/npm-script-ghost
./install.sh
```

Installer: clones/builds ble.sh → `~/.local/share/blesh/out/ble.sh`, copies bash assets to `~/.config/awesome-linux/npm-script-ghost/`, injects marker block into `~/.bashrc` (after `/etc/bashrc` source).

### Files touched

| Path | Marker / notes |
|------|----------------|
| `~/.local/share/blesh/` | upstream ble.sh build (`out/ble.sh`) |
| `~/.config/awesome-linux/npm-script-ghost/*.bash` | completion + faces |
| `~/.bashrc` | `awesome-linux npm-script-ghost` |
| `~/.blerc` | `awesome-linux ble-fedora-dark` (optional faces hook) |

### Verify

```bash
test -f "$HOME/.local/share/blesh/out/ble.sh"
test -f "$HOME/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash"
test -f "$HOME/.config/awesome-linux/npm-script-ghost/ble-fedora-dark.bash"
grep -F 'awesome-linux npm-script-ghost' "$HOME/.bashrc"
# completion smoke (no ble required):
bash --noprofile --norc -c '
  source "$HOME/.config/awesome-linux/npm-script-ghost/npm-run-scripts.bash"
  tmp=$(mktemp -d)
  echo "{\"scripts\":{\"test\":\"true\",\"build\":\"true\"}}" > "$tmp/package.json"
  cd "$tmp"
  COMP_WORDS=(npm run te); COMP_CWORD=2; COMPREPLY=()
  _awesome_linux_npm_run_complete
  echo "COMPREPLY=${COMPREPLY[*]}"
  [[ "${COMPREPLY[*]}" == *test* ]]
  rm -rf "$tmp"
'
```

Ghost UX: user opens **new Ptyxis tab**, types `npm run <prefix>`, Tab accepts. Agent cannot fully assert ghost rendering headlessly.

### Uninstall

```bash
cd tools/npm-script-ghost
./uninstall.sh
```

### Do not

- Do not `chsh`
- Do not `source tools/terminal-npm-ghost/snippets/fedora-dark.fish` from bash
- Do not delete `~/.bash_profile` exports

## Human notes

| Key | Action |
|-----|--------|
| Tab | accept / cycle completion (incl. npm scripts) |
| Right arrow / Ctrl-F / End | accept ble auto_complete ghost at EOL |

Colors: `bash/ble-fedora-dark.bash` (Adwaita Dark muted palette).

## Prefer fish instead?

See [terminal-npm-ghost](../terminal-npm-ghost/).
