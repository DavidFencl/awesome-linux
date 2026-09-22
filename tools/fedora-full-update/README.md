# fedora-full-update

Installs `~/.local/bin/full-update` to run `dnf upgrade --refresh` then `flatpak update`.

## Agent runbook

### Preconditions

- Fedora (or dnf-based) desktop
- `~/.local/bin` on PATH (Fedora default `.bashrc` usually OK)
- Running `full-update` later needs interactive sudo for dnf

### Install

```bash
cd tools/fedora-full-update
./install.sh
```

### Files touched

| Path | Change | Marker |
|------|--------|--------|
| `~/.local/bin/full-update` | executable script | n/a |
| `~/.bashrc` | removes `alias full-update=...`; adds note block | `awesome-linux fedora-full-update` |

### Verify

```bash
test -x "$HOME/.local/bin/full-update"
bash -lc 'type -a full-update' | head -5
# expect: .../full-update is /home/.../.local/bin/full-update
# must NOT be only an alias
grep -F 'awesome-linux fedora-full-update' "$HOME/.bashrc"
```

Do **not** run `full-update` itself in unattended agent sessions (sudo password).

### Uninstall

```bash
cd tools/fedora-full-update
./uninstall.sh
```

### Do not

- Do not leave duplicate `alias full-update=` in `~/.bashrc`
- Do not run unattended `sudo dnf` without user present

## Human notes

```bash
full-update
```
