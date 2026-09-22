# awesome-linux

Tiny Linux tools and improvements I actually use — mostly **Fedora** desktop stuff (Ptyxis, bash/fish, local Node tooling).

Each entry under [`tools/`](tools/) is self-contained: a short README, an install script when useful, and the files you need to drop onto a machine.

## Tools

| Tool | What it does |
|------|----------------|
| [fedora-full-update](tools/fedora-full-update/) | One command to refresh `dnf` and update Flatpaks |
| [terminal-npm-ghost](tools/terminal-npm-ghost/) | **Recommended:** fish ghost autofill + `npm run` Tab via Ptyxis custom command (no `chsh`) |
| [npm-script-ghost](tools/npm-script-ghost/) | Stay on bash: ble.sh ghost autofill + `package.json` script completion |

## Principles

- Prefer distro packages (`dnf`) over random curls when possible
- Prefer **Ptyxis custom command** / user-level config over `chsh` so login shell and `~/.bash_profile` stay intact
- Every tool ships install + uninstall notes
- Document exact accept keys (ghost vs Tab completion are different)
- Prefer small, readable shell; installers should be idempotent

## Layout

```
tools/<name>/
  README.md
  install*.sh
  ...
```

## License

MIT — see [LICENSE](LICENSE).
