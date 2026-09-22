# npm-script-ghost

Ghost autofill for **`npm run <script>`** on **bash** (Fedora + Ptyxis).

When you type a prefix of a script name from the nearest `package.json`, the rest appears as dim “ghost” text. **Tab** accepts it (same idea as fish / zsh-autosuggestions / ble.sh auto-complete).

## How it works

1. **[ble.sh](https://github.com/akinomyoga/ble.sh)** — bash line editor with `complete_auto_complete` (ghost preview of Tab completion).
2. **`npm-run-scripts.bash`** — completion that reads `scripts` from the nearest `package.json` (walks up from `$PWD`).

## Requirements

- Fedora (or any Linux) with bash 4+
- `git`, `make` (to fetch/build ble.sh)
- `node` recommended (for reliable JSON parse); a crude fallback exists without it
- Terminal: **Ptyxis** works fine (no special Ptyxis config)

## Install

```bash
./install.sh
```

Then open a **new** Ptyxis tab (or `source ~/.bashrc`).

## Keys

| Key | Action |
|-----|--------|
| Type `npm run te` | Ghost shows e.g. `st` → full `test` if that script exists |
| **Tab** | Accept the ghost completion (or cycle completions) |
| **Right arrow** / end-of-line accept | ble.sh also accepts auto-complete with right arrow when the cursor is at the end (ble default) |

Exact accept keys follow ble.sh defaults; Tab is the reliable one to document.

## Try it

```bash
cd /path/to/any/node/project
npm run<space><type-a-prefix>
```

## Uninstall

1. Remove the `# >>> awesome-linux npm-script-ghost >>>` … `<<<` block from `~/.bashrc`.
2. Optionally delete:

```bash
rm -rf ~/.config/awesome-linux/npm-script-ghost
rm -rf ~/.local/share/blesh   # only if you do not use ble.sh elsewhere
```

## Notes

- Completes **script names** after `npm run` / `npm run-script`, not every npm subcommand.
- If both npm’s own completion and this one are present, install wraps `_npm_completion` and merges script names.
- This does **not** change fish/zsh; those shells already have stronger ecosystems for this UX.
