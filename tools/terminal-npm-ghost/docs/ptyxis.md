# Ptyxis notes

Ptyxis does not implement fish-style ghost text. Set the profile **Custom command** to the shell that does.

## UI

1. Open Ptyxis Preferences
2. Select your default profile
3. Command → enable **Custom command** → `fish`
4. Prefer **not** forcing a login shell unless you need bash_profile every tab (fish snippet mirrors PATH instead)
5. Open a **new** window: `ptyxis --new-window`

## One-off without changing the profile

```bash
ptyxis --new-window -x fish
```

## dconf

```bash
dconf dump /org/gnome/Ptyxis/ | head
```

Do not mass-edit dconf from install scripts unless tested on the user's exact Ptyxis version.
