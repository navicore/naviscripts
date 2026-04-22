#!/usr/bin/env bash

cd "$(dirname "$0")"


mkdir -p ~/bin/
cp ./bin/* ~/bin/
cp ./tern-config ~/.tern-config
cp ./guile ~/.guile
[ -f ~/.gitconfig ] || cp ./gitconfig ~/.gitconfig
[ -f ~/.racketrc ] || cp ./racketrc ~/.racketrc
[ -f ~/.gitignore ] || cp ./gitignore ~/.gitignore
cp ./scryerrc ~/.scryerrc
cp ./zshrc ~/.zshrc
mkdir -p ~/.config/tmux
cp ./tmux.conf ~/.config/tmux/tmux.conf
cp ./inputrc ~/.inputrc
cp ./Renviron ~/.Renviron
cp ./Rprofile ~/.Rprofile
mkdir -p ~/.config/nvim
cp ./init.lua ~/.config/nvim/
cp ./stylua.toml ~/.config/nvim/
cp -R ./lua ~/.config/nvim/
[ -d ~/.git-template ] || cp -pR git-template/ ~/.git-template/
mkdir -p ~/.claude
cp ./claude/CLAUDE.md ~/.claude/CLAUDE.md
cp ./claude/settings.json ~/.claude/settings.json
mkdir -p  ~/.config/ghostty/
if [ "$(uname)" = "Darwin" ]; then
  cp ./ghostty-macos/config ~/.config/ghostty/config
else
  cp ./ghostty-linux/config ~/.config/ghostty/config
fi
if [ "$(uname)" != "Darwin" ]; then
  mkdir -p ~/.config/hypr
  cp ./hypr/hyprland.conf ~/.config/hypr/hyprland.conf
fi

