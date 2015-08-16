platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

export CLASSPATH=""

export NODE_PATH=.:/usr/local/lib/node_modules
export SLICKEDIT_HOME=$HOME/vs
export ANDROID_SDK="$HOME/android-studio/sdk"
export ANDROID_HOME=$ANDROID_SDK

#antlr
export CLASSPATH=".:/usr/local/lib/antlr-4.4-complete.jar:$CLASSPATH"
export CLASSPATH=".:/usr/local/lib/ST-4.0.8.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.4-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

export PS1='[\u@\h \W]\$ '
export PS2="# "
export PS3="> "

#export PATH="$PATH:$HOME/scala/bin"

BLOCKSIZE=K;	export BLOCKSIZE
VISUAL=vi;    export VISUAL
set -o vi
PAGER=more; export PAGER
EDITOR=vim; export EDITOR

alias cdm='cd $HOME/git/navicore/oemap;pwd'
alias cdo='cd $HOME/git/navicore/OeScript;pwd'

#todo: source a .local_bash file for work laptop
alias cdt='cd $HOME/git/navicore/tercel;pwd'
alias cdi='cd $HOME/git/navicore/infra;pwd'
alias cda='cd $HOME/git/navicore/insight;pwd'

alias fetchupstream='git fetch upstream'
alias mergeupstream='git merge upstream/master'

ulimit -n 4096

if [[ $platform == 'linux' ]]; then
  alias dockerrm='sudo docker rm $(sudo docker ps -a -q)'
  alias dockerstop='sudo docker stop $(sudo docker ps -a -q)'
  alias dockerkill='sudo docker kill $(sudo docker ps -a -q)'
  alias dockerrmi='sudo docker rmi $(sudo docker images -q)'
  alias dockeruntagged='sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")'
  export TERM="screen-256color"
  #alias mytags='ctags -R -f .tags --exclude=node_modules * $JAVA_HOME/src'
  alias mytags='ctags -R -f .tags --exclude=node_modules *'
  alias gvim='UBUNTU_MENUPROXY= gvim'
  export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))/..
  export GIT_EDITOR="vim -f"
elif [[ $platform == 'osx' ]]; then
  eval "$(docker-machine env default)"
  alias dockerrm='docker rm $(docker ps -a -q)'
  alias dockerstop='docker stop $(docker ps -a -q)'
  alias dockerkill='docker kill $(docker ps -a -q)'
  alias dockerrmi='docker rmi $(docker images -q)'
  alias dockeruntagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
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
fi 

source ~/.tmuxinator.bash

# to install rvm
#\curl -sSL https://get.rvm.io | bash -s stable
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#
# example commands:
# foo > stdout.txt 2> stderr.txt
#
# do something n times
# n=0; while [[ $n -lt 10 ]]; do some_command; n=$((n+1)); done 
#
#---------------------------------------------------------
# increment version
#$ v=1.2.13
#$ echo "${v%.*}.$((${v##*.}+1))"
#1.2.14
#---------------------------------------------------------
# rsync -rav --partial --progress . /Volumes/music/amazon/
# git remote add upstream git@github.com:amaret/pollen.git
#---------------------------------------------------------
#write Xs:
#printf "%0.sE" {1..20000} | java -jar gram.jar -P
#---------------------------------------------------------
#git prune
#git remote prune origin --dry-run
#---------------------------------------------------------
# DOCKER:
# stop all containers:
# docker stop $(docker ps -a -q)
#
# remove all untagged images:
# docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
#
#---------------------------------------------------------

#
# remove local storage
#
# chrome://settings/cookies#cont
#
