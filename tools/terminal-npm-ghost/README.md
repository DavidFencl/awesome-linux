# terminal-npm-ghost

Ghost autofill (gray suggested text) + npm script Tab completion for Fedora terminals, especially **Ptyxis**.

## What you get

1. **Ghost text** — as you type, a gray suggestion appears (from history). Accept it without opening a completion menu.
2. **`npm run <script>` Tab completion** — Tab expands script names from the nearest `package.json`.

These use different keys:

- **Ghost accept:** usually **Right Arrow** (or End / Ctrl-F)
- **npm script completion:** **Tab** after `npm run ` (note the space)

## Recommended approach (Fedora + Ptyxis + existing bash)

**Use fish only inside Ptyxis** — do **not** change your login shell with `chsh`.

| Option | Ghost text | npm `run` scripts | Fedora package | Keeps `~/.bash_profile` / ZED_BIN |
|--------|------------|-------------------|----------------|-----------------------------------|
| **fish via Ptyxis custom command** (recommended) | Built-in | Built-in npm completions | `dnf install fish` | Yes (bash stays login shell) |
| zsh + zsh-autosuggestions | Plugin | npm + compinit | `dnf install zsh zsh-autosuggestions` | Yes if Ptyxis → zsh only |
| bash + ble.sh | ble auto-complete | see [npm-script-ghost](../npm-script-ghost/) | ble.sh from upstream | Yes; wires into `~/.bashrc` |

Ptyxis itself does not draw ghost suggestions — the **shell** does.

## Quick install (recommended: fish + Ptyxis)

```bash
./install-fedora.sh
```

Then in Ptyxis: Preferences → Profile → Command → Custom command: `fish`  
(or one-off: `ptyxis --new-window -x fish`)

Open a **new** Ptyxis window.

## Verify

```fish
cd ~/path/to/repo   # project with package.json
npm run <Tab>       # lists script names

echo hello-ghost-test
# type: echo hel   → gray suggestion; Right Arrow accepts
```

## Accept keys (fish)

| Action | Key |
|--------|-----|
| Accept full ghost suggestion | **Right Arrow**, End, or Ctrl-F |
| Accept one word | Alt-Right / Alt-F |
| npm / path completion | **Tab** |

## Uninstall

```bash
./uninstall.sh
# Ptyxis → Profile → Command → back to default
# optional: sudo dnf remove fish
```

## Fallbacks

- **Stay on bash:** [npm-script-ghost](../npm-script-ghost/) (ble.sh) or `snippets/bashrc-ble.sh`
- **Prefer zsh:** `snippets/zshrc-snippet.zsh`

## Scope

- Not Fig/Carapace
- Does not change production servers
- Does not force `chsh -s /usr/bin/fish`

## Colors (Fedora dark)

Install ships `snippets/fedora-dark.fish` → `~/.config/fish/conf.d/awesome-linux-fedora-dark.fish`.

It follows **Adwaita Dark**: muted gray text, one blue accent for commands, dim autosuggestions, soft red errors — not the default loud rainbow syntax.

Re-apply anytime:

```fish
source ~/.config/fish/conf.d/awesome-linux-fedora-dark.fish
```
