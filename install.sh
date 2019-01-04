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
mkdir -p ~/.vim
cp ./scripts.vim ~/.vim/scripts.vim
cp ./vimrc ~/.vimrc
cp ./scalafmt ~/.scalafmt
cp ./eslintrc.yml ~/.eslintrc.yml
cp ./zshrc ~/.zshrc
cp ./tmux.conf ~/.tmux.conf
cp ./inputrc ~/.inputrc
cp ./ctags ~/.ctags
cp ./Rprofile ~/.Rprofile
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/
mkdir -p ~/.config/alacritty/
cp ./alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.cargo
cp ./cargo/env ~/.cargo/env
