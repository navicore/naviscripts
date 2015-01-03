#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################

cp ~/bin/lein ./
cp ~/.lein/profiles.clj ./profiles.clj
cp ~/.vimrc ./vimrc
cp ~/.bashrc ./bashrc
cp ~/.tmux.conf ./tmux.conf
cp ~/.tmuxinator/insight.yml ./insight.yml
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

