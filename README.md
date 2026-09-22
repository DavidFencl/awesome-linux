# awesome-linux

Tiny Linux tools and improvements I actually use — mostly **Fedora** desktop stuff (Ptyxis, bash, local Node tooling).

Each entry under [`tools/`](tools/) is self-contained: a short README, an install script when useful, and the files you need to drop onto a machine.

## Tools

| Tool | What it does |
|------|----------------|
| [fedora-full-update](tools/fedora-full-update/) | One command to refresh `dnf` and update Flatpaks |
| [npm-script-ghost](tools/npm-script-ghost/) | Ghost autofill for `npm run <script>` from `package.json` (bash + ble.sh) |

## Layout

```
tools/<name>/
  README.md      # what / why / how to install / keys
  install.sh     # optional Fedora-friendly installer
  ...            # scripts, bash hooks, configs
```

## Conventions

- Prefer small, readable shell over clever frameworks.
- Document the exact keys and shell assumptions (bash vs fish, Ptyxis, etc.).
- Installers should be idempotent and leave a clear “how to uninstall” note.
- Never require cloud agents or proprietary CLIs for the documented path.

## License

MIT — see [LICENSE](LICENSE).
