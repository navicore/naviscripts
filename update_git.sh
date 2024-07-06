#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################
cp ~/.tern-config ./tern-config
cp ~/.gitignore ./gitignore
cp ~/.zshrc ./zshrc
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
cp ~/bin/klog* ./bin/
cp ~/bin/dev-tmux ./bin/
cp ~/.local/share/devbox/global/default/devbox.json devbox/global/default/devbox.json
