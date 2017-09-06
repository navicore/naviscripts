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
cp ./nvmrc ~/.nvmrc
mkdir -p ~/.vim
cp ./scripts.vim ~/.vim/scripts.vim
cp ./eslintrc.yml ~/.eslintrc.yml
cp ./vimrc ~/.vimrc
#cp ./eslintrc ~/.eslintrc
cp ./zshrc ~/.zshrc
cp ./tmux.conf ~/.tmux.conf
mkdir -p ~/.tmuxinator
cp ./tmuxinator/*.yml ~/.tmuxinator/
cp ./tmuxinator.bash ~/.tmuxinator.bash
cp ./inputrc ~/.inputrc
cp ./Rprofile ~/.Rprofile
cp ./gvimrc ~/.gvimrc
#note, if you add more langs, do a rm ~/.ctags and cat or echo each file
cp ./ctags ~/.ctags
cp ./pylintrc ~/.pylintrc
cp ./rtorrent.rc ~/.rtorrent.rc
cp ./encrypted_vim_rc ~/.encrypted_vim_rc
cp ./ideavimrc ~/.ideavimrc
cp ./irbrc ~/.irbrc
cp ./guile ~/.guile
cp ./haskeline ~/.haskeline

