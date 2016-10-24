platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

ulimit -n 4096
BLOCKSIZE=K;	export BLOCKSIZE
VISUAL=vi;    export VISUAL
set -o vi
PAGER=more; export PAGER
EDITOR=vim; export EDITOR

alias dockerrm='docker rm $(docker ps -a -q)'
alias dockerstop='docker stop $(docker ps -a -q)'
alias dockerkill='docker kill $(docker ps -a -q)'
alias dockerrmi='docker rmi $(docker images -q)'
alias dockerrmif='docker rmi -f $(docker images -q)'
alias dockeruntagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias dockerdangle='docker rmi $(docker images -q --filter dangling=true)'

alias fetchupstream='git fetch upstream'
alias mergeupstream='git merge upstream/master'

export TERM="screen-256color"
export GIT_EDITOR="vim -f"

setopt APPEND_HISTORY

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source ~/.antigen/git/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle docker
antigen bundle terraform
antigen bundle tmux
antigen bundle brew
antigen bundle git
antigen bundle git-flow
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sbodiu-pivotal/fly-zsh-autocomplete-plugin

# Load the theme.
#antigen theme robbyrussell
antigen theme robbyrussell/oh-my-zsh themes/kolo

# Tell antigen that you're done.
antigen apply

export PATH="/usr/local/sbin:/usr/local/bin:$HOME/bin:$PATH"

if [[ $platform == 'linux' ]]; then
  export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))/..
elif [[ $platform == 'osx' ]]; then
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export PATH="$PATH:/usr/local/texlive/2016/bin/x86_64-darwin"
fi 

if [ -f ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi

