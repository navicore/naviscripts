#!/usr/bin/env zsh
# 10-zinit.zsh - Zinit plugin management

# Bootstrap zinit if needed (this check allows the main loader to verify)
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load important annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

#
# Plugin Loading Order Matters!
# 1. Syntax highlighting and completions plugins
# 2. Completion system initialization (compinit)
# 3. UI enhancement plugins (fzf-tab)
#

# Essential plugins - loaded immediately
zinit light zsh-users/zsh-completions
zinit light ryutok/rust-zsh-completions

# Git helpers
zinit light caarlos0/git-add-remote

# Java version management
zinit light cmuench/zsh-jenv

# Vi mode improvements (load before syntax highlighting)
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Initialize completion system
autoload -U compinit && compinit

# Completion caching configuration
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'r:|=*' 'l:|=* r:|=*'

# Enhanced completion UI - must be loaded AFTER compinit
zinit light Aloxaf/fzf-tab

# Syntax highlighting - should be loaded last
zinit light zsh-users/zsh-syntax-highlighting

#
# Lazy-loaded plugins (loaded when shell is idle)
#

# Additional completions and tools can be loaded with wait
# Example:
# zinit ice wait lucid
# zinit light some/plugin
