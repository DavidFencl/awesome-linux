# Live diagnosis checklist (run on the Fedora laptop)

```bash
echo "SHELL=$SHELL"
ps -p $(ps -o ppid= -p $$) -o args= 2>/dev/null || true
command -v bash zsh fish ptyxis node npm
bash --version | head -1
zsh --version 2>/dev/null; fish --version 2>/dev/null
rpm -q fish zsh zsh-autosuggestions bash-completion ptyxis 2>/dev/null
flatpak list 2>/dev/null | grep -i ptyxis || true
ls ~/.local/share/blesh/out 2>/dev/null | head
test -f ~/.bash_profile && echo has_bash_profile
grep -nE 'ZED_BIN|nvm|fnm|Herdr|ble|autosuggest|npm completion|awesome-linux' ~/.bash_profile ~/.bashrc ~/.profile 2>/dev/null
dconf dump /org/gnome/Ptyxis/ 2>/dev/null | head -60
find ~/Documents/Work -maxdepth 3 -name package.json 2>/dev/null | head -20
```

Record: login shell, Ptyxis custom command (if any), whether fish/zsh/ble already present, where ZED_BIN is set.
