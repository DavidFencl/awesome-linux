# terminal-npm-ghost

**fish** ghost suggestions + `npm run` Tab completion, used as **Ptyxis custom command only** (login shell stays bash).

## Agent runbook

### Preconditions

- Fedora + Ptyxis
- Interactive sudo available for `dnf install fish` if missing
- User OK with Ptyxis profile Custom command = `fish` (agent prints steps; does not force dconf)

### Diagnosis (run before install)

```bash
bash tools/terminal-npm-ghost/docs/diagnosis-checklist.md 2>/dev/null || true
# or run the commands inside docs/diagnosis-checklist.md
command -v fish || true
rpm -q fish ptyxis bash-completion
dconf dump /org/gnome/Ptyxis/ 2>/dev/null | head -40
```

### Install

```bash
cd tools/terminal-npm-ghost
./install-fedora.sh
```

Then instruct user (or document as remaining step):

1. Ptyxis → Preferences → Profile → Command → Custom command: `fish`
2. Or one-off: `ptyxis --new-window -x fish`
3. Open a **new** window/tab

### Files touched

| Path | Notes |
|------|-------|
| `dnf` package `fish` | sudo |
| `~/.config/fish/conf.d/awesome-linux-npm-ghost.fish` | PATH / ZED_BIN mirrors |
| `~/.config/fish/conf.d/awesome-linux-fedora-dark.fish` | Adwaita Dark colors |

Does **not** modify `~/.bash_profile` or call `chsh`.

### Verify

```bash
command -v fish
test -f "$HOME/.config/fish/conf.d/awesome-linux-npm-ghost.fish"
test -f "$HOME/.config/fish/conf.d/awesome-linux-fedora-dark.fish"
test -f /usr/share/fish/completions/npm.fish
# fish loads conf.d itself — do not source .fish files from bash
fish -c 'echo fish_ok; type fish_add_path >/dev/null'
```

Ghost accept = **Right Arrow**; npm scripts = **Tab** after `npm run `. User confirms in Ptyxis.

### Uninstall

```bash
cd tools/terminal-npm-ghost
./uninstall.sh
# User: clear Ptyxis custom command back to default
```

### Do not

- Do not `chsh -s /usr/bin/fish`
- Do not tell the user to `source …fedora-dark.fish` from **bash**
- Do not strip `ZED_BIN` from bash_profile

## Human notes

See [docs/accept-keys.md](docs/accept-keys.md), [docs/ptyxis.md](docs/ptyxis.md).

Bash fallback: [npm-script-ghost](../npm-script-ghost/).
