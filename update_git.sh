#!/usr/bin/env bash

cd "$(dirname "$0")"

cp ~/.tern-config ./tern-config
cp ~/.gitignore ./gitignore
cp ~/.scryerrc ./scryerrc
cp ~/.config/tmux/tmux.conf ./tmux.conf
cp ~/.inputrc ./inputrc
cp ~/.Rprofile ./Rprofile
cp ~/.Renviron ./Renviron

mkdir -p ./bin
cp ~/bin/plant* ./bin/
cp ~/bin/killz ./bin/
cp ~/bin/pg* ./bin/
cp ~/bin/mntdir ./bin/

if [ "$(uname)" = "Darwin" ]; then
  cp ~/.config/ghostty/config ./ghostty-macos/config
else
  cp ~/.config/ghostty/config ./ghostty-linux/config
fi
