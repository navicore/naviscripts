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
if command -v eza >/dev/null 2>&1; then
    alias l='eza'
    alias ls='eza'
    alias ll='eza -l --header --git --tree --level 3'
    alias la='eza -la --header --git'
else
    alias l='ls -G'
    alias ll='ls -lhG'
    alias la='ls -lahG'
fi

if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Editor shortcuts
alias vim='nvim'
alias vi='nvim'

# Git shortcuts
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --graph --decorate'
alias fetchupstream='git fetch upstream'
alias mergeupstreammain='git merge upstream/main'
alias mergeupstreammaster='git merge upstream/master'

# Docker shortcuts
alias dockerrm='docker rm $(docker ps -a -q)'
alias dockerrmi='docker rmi $(docker images -q)'
alias dockerrmif='docker rmi -f $(docker images -q)'

# Kubernetes
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'

#
# Helper Functions
#

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Show path in readable format
alias path='echo $PATH | tr ":" "\n"'

# Reload zsh configuration
alias reload='source ~/.zshrc && echo "Reloaded zsh configuration"'

# Update naviscripts from git
update-naviscripts() {
    (
        cd ~/naviscripts || return 1
        echo "Updating naviscripts..."
        git pull
        source ~/.zshrc
        echo "✓ Updated naviscripts"
    )
}

# Quick edit configs
alias zshconfig='$EDITOR ~/naviscripts/src/zsh/'
alias vimconfig='$EDITOR ~/.config/nvim/'
alias tmuxconfig='$EDITOR ~/.config/tmux/tmux.conf'

# System-specific aliases
if [[ "$IS_MACOS" == true ]]; then
    # macOS specific aliases
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
    alias flushdns='sudo dscacheutil -flushcache'

    # Open current directory in Finder
    alias finder='open .'
elif [[ "$IS_LINUX" == true ]]; then
    # Linux specific aliases
    alias open='xdg-open'

    # System updates
    if command -v apt >/dev/null 2>&1; then
        alias update='sudo apt update && sudo apt upgrade'
    elif command -v dnf >/dev/null 2>&1; then
        alias update='sudo dnf upgrade'
    elif command -v pacman >/dev/null 2>&1; then
        alias update='sudo pacman -Syu'
    fi
fi
