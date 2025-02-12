if [ -f ~/.zshrc_pre ]; then
  . ~/.zshrc_pre
fi

source ~/naviscripts/src/zshrc

if [ -f ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi
