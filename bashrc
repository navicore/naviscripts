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

export PATH="$SLICKEDIT_HOME/bin:$HOME/bin:/usr/local/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH:$HOME/npm/bin:$HOME/scala/bin"

BLOCKSIZE=K;	export BLOCKSIZE
VISUAL=vi;    export VISUAL
set -o vi
PAGER=more; export PAGER
EDITOR=vim; export EDITOR

alias cdm='cd $HOME/git/navicore/oemap;pwd'
alias cdo='cd $HOME/git/navicore/oescript;pwd'

#todo: source a .local_bash file for work laptop
alias cdt='cd $HOME/git/navicore/tercel;pwd'
alias cdi='cd $HOME/git/navicore/infra;pwd'
alias cda='cd $HOME/git/navicore/insight;pwd'

#to add upstream master:
#git remote add upstream htps://github.com/octocat/Spoon-Knife.git
alias fetchupstream='git fetch upstream'
alias mergeupstream='git merge upstream/master'

ulimit -n 4096

if [[ $platform == 'linux' ]]; then
  #export TERM="xterm-256color"
  export TERM="screen-256color"
  alias mytags='ctags -R -f .tags --exclude=node_modules * $JAVA_HOME/src'
  #~/.vim/bundle/gruvbox/gruvbox_256palette.sh
  alias gvim='UBUNTU_MENUPROXY= gvim'
  export JAVA_HOME=$(dirname $(dirname $(readlink -f /usr/bin/java)))/..
  export GIT_EDITOR="vim -f"
elif [[ $platform == 'osx' ]]; then
  export TERM="screen-256color"
  #R for rJava
  #alias R='unset JAVA_HOME && R'  #bettter solution is add 
  #                                #'unset JAVA_HOME' to /usr/bin/R
  alias rstudio='unset JAVA_HOME && LD_LIBRARY_PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home/jre/lib/server: open -a /Applications/RStudio/RStudio.app/Contents/MacOS/RStudio'
  alias mytags='/usr/local/bin/ctags -R -f .tags --exclude=node_modules * $JAVA_HOME/src'
  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
  function vim { /usr/local/bin/vim $*; }
  export JAVA_HOME="$(/usr/libexec/java_home)"
  #export GIT_EDITOR="gvim -g -f"
  export GIT_EDITOR="vim -f"
  export PATH=$PATH:/Applications/antlrworks2/bin
fi 

source ~/.tmuxinator.bash
#export TUTIL_LOG_DIR=/var/log/insight

# to install rvm
#\curl -sSL https://get.rvm.io | bash -s stable
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/google-cloud-sdk/path.bash.inc ]; then
  source "$HOME/google-cloud-sdk/path.bash.inc"
fi

# The next line enables bash completion for gcloud.
if [ -f $HOME/google-cloud-sdk/completion.bash.inc ]; then
  source "$HOME/google-cloud-sdk/completion.bash.inc"
fi

#
# example commands:
#
#---------------------------------------------------------
# increment version
#$ v=1.2.13
#$ echo "${v%.*}.$((${v##*.}+1))"
#1.2.14
#---------------------------------------------------------
# rsync -rav --partial --progress . /Volumes/music/amazon/
# git remote add upstream git@github.com:falkonry/infra.git
#---------------------------------------------------------
#write Xs:
#printf "%0.sE" {1..20000} | java -jar gram.jar -P
#---------------------------------------------------------
#git prune
#git remote prune origin --dry-run
#---------------------------------------------------------

