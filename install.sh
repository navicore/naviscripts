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
mkdir -p ~/.vim
cp ./scripts.vim ~/.vim/scripts.vim
cp ./vimrc ~/.vimrc
cp ./scalafmt ~/.scalafmt
cp ./zshrc ~/.zshrc
cp -n ./tmux.conf ~/.tmux.conf
cp ./inputrc ~/.inputrc
cp ./Renviron ~/.Renviron
cp ./ctags ~/.ctags
cp ./Rprofile ~/.Rprofile
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/
mkdir -p ~/.cargo
cp ./cargo/env ~/.cargo/env
cp ./cargo/config ~/.cargo/config

mkdir -p ~/.config/nvim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json 
