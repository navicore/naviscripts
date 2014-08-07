#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################

FILENAME="${USER}_dot_files.tar"

cd ~
tar cvf $FILENAME .vimrc .bashrc .tmux.conf .tmuxinator/insight.yml .tmuxinator.bash .inputrc .Rprofile .profile .gvimrc .ctags .pylintrc .rtorrent.rc .npmrc .encrypted_vim_rc .ideavimrc .irbrc 

echo "tar file is in ~ as: $FILENAME"
gzip "$FILENAME"

