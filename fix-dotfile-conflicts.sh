#!/usr/bin/env bash
# fix-dotfile-conflicts.sh

set -euo pipefail
backup_suffix="$(date +%Y%m%d%H%M%S)"

# 1.  Move aside every file that blocks stow -------------------------------
for f in \
  "$HOME/.config/eza/theme.yml" \
  "$HOME/.config/htop/htoprc" \
  "$HOME/.local/bin/cheatsheet" \
  "$HOME/.config/uv/uv-receipt.json" \
  "$HOME/.config/zsh/.zshrc" \
  "$HOME/.config/zsh/aliases.zsh" \
  "$HOME/.config/zsh/completions.zsh" \
  "$HOME/.config/zsh/functions.zsh"
do
  if [[ -e "$f" && ! -L "$f" ]]; then
    echo "Moving $f  →  ${f}.bak.${backup_suffix}"
    mv "$f" "${f}.bak.${backup_suffix}"
  fi
done

# 2.  Restow every package -------------------------------------------------
cd ~/dotfiles
stow -v -R -d ~/dotfiles -t "$HOME" \
     bat brave cheats eza ghostty git github htop iterm2 localbin thefuck uv zsh

