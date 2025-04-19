#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################

mkdir -p ~/bin/
cp ./bin/* ~/bin/
cp ./tern-config ~/.tern-config
cp ./guile ~/.guile
cp -n ./gitconfig ~/.gitconfig
cp -n ./racketrc ~/.racketrc
cp -n ./gitignore ~/.gitignore
cp ./scryerrc ~/.scryerrc
cp ./zshrc ~/.zshrc
mkdir -p ~/.config/wezterm
cp ./wezterm.lua ~/.config/wezterm/wezterm.lua
mkdir -p ~/.config/wezterm_config
cp -R ./wezterm_config ~/.config/wezterm/
mkdir -p ~/.config/tmux
cp ./tmux.conf ~/.config/tmux/tmux.conf
cp ./inputrc ~/.inputrc
cp ./Renviron ~/.Renviron
cp ./Rprofile ~/.Rprofile
mkdir -p ~/.config/nvim
cp ./init.lua ~/.config/nvim/
cp ./stylua.toml ~/.config/nvim/
cp -R ./lua ~/.config/nvim/
cp -npR git-template/ ~/.git-template/
mkdir -p  ~/.config/ghostty/
cp -R ./ghostty ~/.config/
mkdir -p  ~/.config/zed/
cp ./zed/* ~/.config/zed/
