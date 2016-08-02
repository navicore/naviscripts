
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gnzh"
#ZSH_THEME="gentoo"
ZSH_THEME="kolo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# User configuration

export PATH="~/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/antlrworks2/bin:~/Library/Python/2.7/bin:~/.rvm/bin:~/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#

BLOCKSIZE=K;	export BLOCKSIZE
VISUAL=vi;    export VISUAL
set -o vi
PAGER=more; export PAGER
EDITOR=vim; export EDITOR

alias fetchupstream='git fetch upstream'
alias mergeupstream='git merge upstream/master'

ulimit -n 4096

if [[ $platform == 'linux' ]]; then
  export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
  alias dockerrm='sudo docker rm $(sudo docker ps -a -q)'
  alias dockerstop='sudo docker stop $(sudo docker ps -a -q)'
  alias dockerkill='sudo docker kill $(sudo docker ps -a -q)'
  alias dockerrmi='sudo docker rmi $(sudo docker images -q)'
  alias dockerrmif='sudo docker rmi -f $(sudo docker images -q)'
  alias dockeruntagged='sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")'
  alias dockerdangle='sudo docker rmi $(docker images -q --filter dangling=true)'
  export TERM="screen-256color"
  #alias mytags='ctags -R -f .tags --exclude=node_modules * $JAVA_HOME/src'
  alias mytags='ctags -R -f .tags --exclude=node_modules *'
  alias gvim='UBUNTU_MENUPROXY= gvim'
  export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))/..
  export GIT_EDITOR="vim -f"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
elif [[ $platform == 'osx' ]]; then
  export ZSH=~/.oh-my-zsh # Path to your oh-my-zsh installation.
  alias dockerrm='docker rm $(docker ps -a -q)'
  alias dockerstop='docker stop $(docker ps -a -q)'
  alias dockerkill='docker kill $(docker ps -a -q)'
  alias dockerrmi='docker rmi $(docker images -q)'
  alias dockerrmif='docker rmi -f $(docker images -q)'
  alias dockeruntagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
  alias dockerdangle='docker rmi $(docker images -q --filter dangling=true)'
  #export TERM="xterm-256color"
  export TERM="screen-256color"
  #alias mytags='/usr/local/bin/ctags -R -f .tags --exclude=node_modules * $JAVA_HOME/src'
  alias mytags='/usr/local/bin/ctags -R -f .tags --exclude=node_modules *'
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
  function vim { /usr/local/bin/vim $*; }
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export GIT_EDITOR="vim -f"
  export PATH=$PATH:/Applications/antlrworks2/bin
  export PATH=/usr/local/sbin:$PATH
  export PATH=$PATH:$HOME/Library/Python/2.7/bin
  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
fi 

source $ZSH/oh-my-zsh.sh
if [ -f ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

setopt APPEND_HISTORY

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

