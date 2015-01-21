#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################

mkdir -p ~/bin/
cp ./lein ~/bin/
mkdir -p ~/.lein
cp ./profiles.clj ~/.lein/
cp ./vimrc ~/.vimrc
cp ./bashrc ~/.bashrc
cp ./tmux.conf ~/.tmux.conf
mkdir -p ~/.tmuxinator
cp ./insight.yml ~/.tmuxinator/
cp ./amaret.yml ~/.tmuxinator/
cp ./R.yml ~/.tmuxinator/
cp ./tmuxinator.bash ~/.tmuxinator.bash
cp ./inputrc ~/.inputrc
cp ./Rprofile ~/.Rprofile
cp ./profile ~/.profile
cp ./gvimrc ~/.gvimrc
#note, if you add more langs, do a rm ~/.ctags and cat or echo each file
cp ./ctags ~/.ctags
cp ./pylintrc ~/.pylintrc
cp ./rtorrent.rc ~/.rtorrent.rc
cp ./encrypted_vim_rc ~/.encrypted_vim_rc
cp ./ideavimrc ~/.ideavimrc
cp ./irbrc ~/.irbrc
cp ./guile ~/.guile

