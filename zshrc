platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

#ZSH_THEME="kolo"

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

BLOCKSIZE=K;	export BLOCKSIZE
VISUAL=vi;    export VISUAL
set -o vi
PAGER=more; export PAGER
EDITOR=vim; export EDITOR

alias fetchupstream='git fetch upstream'
alias mergeupstream='git merge upstream/master'

ulimit -n 4096

if [[ $platform == 'linux' ]]; then
  alias dockerrm='sudo docker rm $(sudo docker ps -a -q)'
  alias dockerstop='sudo docker stop $(sudo docker ps -a -q)'
  alias dockerkill='sudo docker kill $(sudo docker ps -a -q)'
  alias dockerrmi='sudo docker rmi $(sudo docker images -q)'
  alias dockerrmif='sudo docker rmi -f $(sudo docker images -q)'
  alias dockeruntagged='sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")'
  alias dockerdangle='sudo docker rmi $(docker images -q --filter dangling=true)'
  export TERM="screen-256color"
  export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))/..
  export GIT_EDITOR="vim -f"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
elif [[ $platform == 'osx' ]]; then
  alias dockerrm='docker rm $(docker ps -a -q)'
  alias dockerstop='docker stop $(docker ps -a -q)'
  alias dockerkill='docker kill $(docker ps -a -q)'
  alias dockerrmi='docker rmi $(docker images -q)'
  alias dockerrmif='docker rmi -f $(docker images -q)'
  alias dockeruntagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
  alias dockerdangle='docker rmi $(docker images -q --filter dangling=true)'
  export TERM="screen-256color"
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
  function vim { /usr/local/bin/vim $*; }
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export GIT_EDITOR="vim -f"
  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
fi 

if [ -f ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi

setopt APPEND_HISTORY

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source ~/.antigen/git/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
antigen theme robbyrussell/oh-my-zsh themes/kolo

# Tell antigen that you're done.
antigen apply


