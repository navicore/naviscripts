#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################
cp ~/.config/alacritty/alacritty.yml .
cp ~/.tern-config ./tern-config
cp ~/.gitconfig ./gitconfig
cp ~/.eslintrc.yml ./eslintrc.yml
cp ~/.scalafmt ./scalafmt
cp ~/.vim/scripts.vim ./scripts.vim
cp ~/.vimrc ./vimrc
cp ~/.zshrc ./zshrc
cp ~/.tmux.conf ./tmux.conf
cp ~/.inputrc ./inputrc
cp ~/.ctags ./ctags
cp ~/.Rprofile ./Rprofile
cp ~/.Renviron ./Renviron
cp ~/.config/nvim/init.vim ./init.vim
cp ~/.cargo/env ./cargo/env

mkdir -p ./bin
cp ~/bin/plant* ./bin/
cp ~/bin/killz ./bin/
cp ~/bin/pg* ./bin/

