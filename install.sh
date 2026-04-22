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

mkdir -p ~/.pi/agent/extensions
mkdir -p ~/.pi/agent/prompts
[ -f ~/.pi/agent/settings.json ] || cp ./pi/agent/settings.json ~/.pi/agent/settings.json
# copy prompts and extensions only if they don't already exist
[ -d ./pi/agent/prompts ] && find ./pi/agent/prompts -name '*.md' -exec sh -c 'for f; do dest="$HOME/.pi/agent/prompts/$(basename "$f")"; [ -f "$dest" ] || cp "$f" "$dest"; done' _ {} +
[ -d ./pi/agent/extensions ] && find ./pi/agent/extensions -name '*.ts' -exec sh -c 'for f; do dest="$HOME/.pi/agent/extensions/$(basename "$f")"; [ -f "$dest" ] || cp "$f" "$dest"; done' _ {} +
# install pi packages from settings
if command -v pi >/dev/null 2>&1; then
  pi update 2>/dev/null || true
fi

mkdir -p  ~/.config/ghostty/
if [ "$(uname)" = "Darwin" ]; then
  cp ./ghostty-macos/config ~/.config/ghostty/config
else
  cp ./ghostty-linux/config ~/.config/ghostty/config
fi
