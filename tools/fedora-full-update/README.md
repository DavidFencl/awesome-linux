# fedora-full-update

One command for a Fedora desktop refresh:

```bash
sudo dnf upgrade --refresh -y
flatpak update -y   # skipped if flatpak is missing
```

This started life as a `~/.bashrc` alias (`full-update=...`) and is published here as a real script on `PATH`.

## Install (Fedora)

From this directory:

```bash
./install.sh
```

That copies `full-update` to `~/.local/bin/full-update` and removes duplicate `alias full-update=...` lines from `~/.bashrc` so the script wins.

Ensure `~/.local/bin` is on your `PATH` (Fedora’s default `.bashrc` already does this).

## Usage

```bash
full-update
```

You will be prompted for your sudo password for the `dnf` step.

## Uninstall

```bash
rm -f ~/.local/bin/full-update
# optional: remove the awesome-linux marker block from ~/.bashrc
```
