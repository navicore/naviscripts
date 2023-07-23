#!/usr/bin/env bash

cd "$(dirname "$0")"

####################################################################
#                                                                  #
# remember to edit install.sh, update_git.sh, and tar_dot_files.sh #
#                                                                  #
####################################################################
cp ~/.tern-config ./tern-config
cp ~/.gitignore ./gitignore
cp ~/.scalafmt ./scalafmt
cp ~/.vim/scripts.vim ./scripts.vim
cp ~/.vimrc ./vimrc
cp ~/.zshrc ./zshrc
cp ~/.scryerrc ./scryerrc
cp ~/.config/tmux/tmux.conf ./tmux.conf
cp ~/.inputrc ./inputrc
cp ~/.ctags ./ctags
cp ~/.Rprofile ./Rprofile
cp ~/.Renviron ./Renviron
cp ~/.config/nvim/init.vim ./init.vim
cp ~/.config/nvim/lua/setup.lua ./lua/setup.lua
cp ~/.config/nvim/lua/plugins.lua ./lua/plugins.lua

mkdir -p ./cargo
cp ~/.cargo/env ./cargo/env
cp ~/.cargo/config ./cargo/config

mkdir -p ./bin
cp ~/bin/plant* ./bin/
cp ~/bin/killz ./bin/
cp ~/bin/pg* ./bin/
cp ~/bin/mntdir ./bin/
cp ~/bin/klog* ./bin/
cp ~/bin/dev-tmux ./bin/
