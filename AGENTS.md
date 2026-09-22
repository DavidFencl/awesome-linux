# AGENTS.md — how coding agents use this repo

Primary audience: **coding agents** installing or extending tiny Fedora desktop tools on a user’s machine (often via local-exec / `machineId`).

Humans may skim [README.md](README.md); follow **this file** when acting.

## Hard constraints (do not violate)

- **No `chsh`** unless the user explicitly asks to change login shell.
- **No production / server hosts** — desktop Fedora only (Ptyxis, user home).
- **Do not break login profile exports** — preserve `~/.bash_profile` bits (`ZED_BIN`, Herdr, Toolbox, bun, PATH). Prefer Ptyxis custom command or `conf.d` snippets that *mirror* PATH instead of rewriting bash_profile.
- **Do not mass-edit dconf** for Ptyxis unless the user asks; print UI steps instead.
- **Idempotent installs** — re-running install must not duplicate marker blocks.
- **Marker comments** — all shell/config edits must sit between:
  `# >>> awesome-linux <tool-id> >>>` … `# <<< awesome-linux <tool-id> <<<`
- **Sudo** — only for `dnf`/`flatpak` system packages; expect interactive password; never pass `-S` with a stolen password.

## Discover tools

```bash
ls tools/
# each tools/<id>/ has README.md with an "## Agent runbook" section
```

Tool index (keep README table in sync when adding):

| id | path | default host shell |
|----|------|--------------------|
| `fedora-full-update` | `tools/fedora-full-update/` | any (installs `~/.local/bin/full-update`) |
| `npm-script-ghost` | `tools/npm-script-ghost/` | **bash + ble.sh** (no fish required) |
| `terminal-npm-ghost` | `tools/terminal-npm-ghost/` | **fish via Ptyxis custom command** (login shell stays bash) |

## Start here (agent checklist)

1. Confirm host: Fedora desktop, user home writable, optional `machineId` laptop.
2. `git clone` / `git pull` this repo (or use existing `~/Documents/Work/awesome-linux`).
3. Read `tools/<id>/README.md` → **Agent runbook**.
4. Run diagnosis commands in that runbook (or `tools/terminal-npm-ghost/docs/diagnosis-checklist.md` for shell/ghost work).
5. Run `./install*.sh` from the tool directory (cwd = tool dir).
6. Run **Verify** commands; only then report success to the user.
7. If reversing: run `./uninstall.sh` if present, else follow Uninstall in the runbook.

## Install conventions

- Scripts: `bash`, `set -euo pipefail`, printable progress (`==>` lines).
- User-level files live under:
  - `~/.local/bin/` — executables on PATH
  - `~/.config/awesome-linux/<tool-id>/` — copied assets
  - `~/.config/fish/conf.d/` — fish snippets (marker or distinct filename)
  - `~/.bashrc` / `~/.blerc` — only inside marker blocks
- Prefer `install -m 0644|0755` over `cp` for mode clarity.
- After bashrc/blerc changes: tell user to open a **new terminal tab** (do not assume current shell reloaded).

## Verify conventions

Every tool README must include copy-pasteable checks an agent can run non-interactively where possible, e.g.:

```bash
test -x "$HOME/.local/bin/full-update"
grep -F 'awesome-linux fedora-full-update' "$HOME/.bashrc"
```

Interactive UX (ghost accept keys) — document keys; agent reports “user must confirm in Ptyxis” rather than faking TTY ghost.

## Uninstall conventions

- Remove marker blocks from `~/.bashrc` / `~/.blerc`.
- Remove `~/.config/awesome-linux/<tool-id>/` and tool-specific conf.d files.
- Do **not** delete ble.sh or fish unless uninstall doc says so and user confirmed (shared deps).
- Restore Ptyxis custom command via printed UI steps (not silent dconf).

## Add a new tool

Create `tools/<kebab-id>/` with at least:

```
tools/<id>/
  README.md          # must include ## Agent runbook (see template below)
  install.sh         # or install-fedora.sh
  uninstall.sh       # required unless README proves pure docs
  # assets...
```

### README template (agent-first)

```markdown
# <id>

One-line purpose.

## Agent runbook

### Preconditions
- OS / packages / sudo?

### Install
\`\`\`bash
cd tools/<id>
./install.sh
\`\`\`

### Files touched
- path — what — marker id

### Verify
\`\`\`bash
# commands that exit 0 on success
\`\`\`

### Uninstall
\`\`\`bash
./uninstall.sh
\`\`\`

### Do not
- bullet list

## Human notes (optional)
Short skim: keys, screenshots refs, why.
```

Also: add a row to the tools table in [README.md](README.md) and [AGENTS.md](AGENTS.md).

## Reply shape when done

Tell the user (and any orchestrating agent):

1. Repo/commit or PR URL
2. Tool id installed
3. Verify results (pass/fail)
4. Manual steps left (Ptyxis UI, new tab, sudo already done, etc.)
