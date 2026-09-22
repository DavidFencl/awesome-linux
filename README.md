# awesome-linux

Tiny **Fedora desktop** tools meant to be **installed and maintained by coding agents**.

**Agents:** start at [AGENTS.md](AGENTS.md).  
**Humans:** skim the table below; each tool README has an optional “Human notes” section.

## Tools

| id | What | Agent entry |
|----|------|-------------|
| [fedora-full-update](tools/fedora-full-update/) | `full-update` → `dnf upgrade --refresh` + `flatpak update` | [runbook](tools/fedora-full-update/README.md#agent-runbook) |
| [npm-script-ghost](tools/npm-script-ghost/) | bash + ble.sh ghost + `npm run` script completion | [runbook](tools/npm-script-ghost/README.md#agent-runbook) |
| [terminal-npm-ghost](tools/terminal-npm-ghost/) | fish ghost via Ptyxis custom command (no `chsh`) | [runbook](tools/terminal-npm-ghost/README.md#agent-runbook) |

## Non-goals

- Not a general awesome-list of links
- Not server/production hardening
- Not “change the user’s login shell” by default

## License

MIT — [LICENSE](LICENSE).
