#!/usr/bin/env zsh
# 20-aliases.zsh - Command aliases and functions

# Editor configuration
export VISUAL="${VISUAL:-nvim}"
export EDITOR="${EDITOR:-$VISUAL}"
export GIT_EDITOR="$VISUAL -f"
export PAGER="${PAGER:-more}"

# Set vi mode for command line editing
set -o vi

# Enable command line editing in external editor
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#
# Aliases
#

# Modern replacements for standard tools (if available)
if (( $+commands[eza] )); then
    alias l='eza'
    alias ls='eza'
    alias ll='eza -l --header --git --tree --level 3'
    alias la='eza -la --header --git'
else
    alias l='ls -G'
    alias ll='ls -lhG'
    alias la='ls -lahG'
fi

if (( $+commands[bat] )); then
    alias cat='bat --paging=never'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Editor shortcuts
alias vim='nvim'
alias vi='nvim'

alias c='clear'

# Git shortcuts
alias gl='git log --oneline --graph --decorate'

# Docker shortcuts
alias dockerrm='docker rm $(docker ps -a -q)'
alias dockerrmi='docker rmi $(docker images -q)'
alias dockerrmif='docker rmi -f $(docker images -q)'
alias myspec=' mkdir -p .claude/commands && cp -R ~/git/navicore/myspec/.claude/commands/* .claude/commands/'

# Kubernetes
alias k='kubectl'

# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Show path in readable format
alias path='echo $PATH | tr ":" "\n"'

alias tmux-tmp='tmux new-session -s "One Off"'

