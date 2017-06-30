#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################

cp ~/.tern-config ./tern-config
cp ~/.nvmrc ./nvmrc
cp ~/.vim/scripts.vim ./scripts.vim
cp ~/.eslintrc.yml ./eslintrc.yml
cp ~/.vimrc ./vimrc
#cp ~/.eslintrc ./eslintrc
cp ~/.bashrc ./bashrc
cp ~/.zshrc ./zshrc
cp ~/.tmux.conf ./tmux.conf
cp ~/.tmuxinator/*.yml ./tmuxinator/ && git add ./tmuxinator/*.yml
cp ~/.tmuxinator.bash ./tmuxinator.bash
cp ~/.inputrc ./inputrc
cp ~/.Rprofile ./Rprofile
cp ~/.profile ./profile
cp ~/.gvimrc ./gvimrc

cp ~/.ctags ./ctags
cp ~/.pylintrc ./pylintrc
cp ~/.rtorrent.rc ./rtorrent.rc
cp ~/.encrypted_vim_rc ./encrypted_vim_rc
cp ~/.ideavimrc ./ideavimrc
cp ~/.irbrc ./irbrc
cp ~/.guile ./guile
cp ~/.haskeline ./haskeline

mkdir -p ./bin
cp ~/bin/* ./bin/

