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
cp -n ./racketrc ~/.racketrc
cp -n ./gitignore ~/.gitignore
mkdir -p ~/.vim
cp ./scripts.vim ~/.vim/scripts.vim
cp ./vimrc ~/.vimrc
cp ./scryerrc ~/.scryerrc
cp ./scalafmt ~/.scalafmt
cp ./zshrc ~/.zshrc
mkdir -p ~/.config/tmux
cp ./tmux.conf ~/.config/tmux/tmux.conf
cp ./inputrc ~/.inputrc
cp ./Renviron ~/.Renviron
cp ./ctags ~/.ctags
cp ./Rprofile ~/.Rprofile
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/
cp -R ./lua ~/.config/nvim/
mkdir -p ~/.cargo
cp ./cargo/env ~/.cargo/env
cp ./cargo/config ~/.cargo/config

cp -npR git-template/ ~/.git-template/
mkdir -p ~/.config/nvim/snippets
cp ./snippets/* ~/.config/nvim/snippets/
