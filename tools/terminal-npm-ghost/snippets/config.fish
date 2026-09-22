# awesome-linux / terminal-npm-ghost — fish snippet for Ptyxis tabs
# Installed to ~/.config/fish/conf.d/awesome-linux-npm-ghost.fish

if test -d "$HOME/.local/bin"
    fish_add_path -g "$HOME/.local/bin"
end
if test -d "$HOME/.npm-global/bin"
    fish_add_path -g "$HOME/.npm-global/bin"
end
if test -d "$HOME/.grok/bin"
    fish_add_path -g "$HOME/.grok/bin"
end
if test -d "$HOME/.bun/bin"
    fish_add_path -g "$HOME/.bun/bin"
end
# pi-node (laptop)
if test -d "$HOME/.local/share/pi-node"
    for n in $HOME/.local/share/pi-node/node-*/bin
        if test -d "$n"
            fish_add_path -g "$n"
        end
    end
end

if test -z "$ZED_BIN"
    for candidate in "$HOME/.local/bin/zed" /usr/bin/zed /var/lib/flatpak/exports/bin/zed
        if test -x "$candidate"
            set -gx ZED_BIN "$candidate"
            break
        end
    end
end

# Ghost suggestions are on by default in fish.
# Accept: Right Arrow / End / Ctrl-F
# npm run <Tab> uses fish's bundled npm completions (package.json scripts).
