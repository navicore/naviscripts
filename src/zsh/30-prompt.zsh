#!/usr/bin/env zsh
# 30-prompt.zsh - Prompt configuration

# GPG TTY configuration for signing
export GPG_TTY=$(tty)

# Enable colors in prompt
autoload -U colors && colors

# Enable version control information
autoload -Uz vcs_info

# Git prompt configuration (if using gitstatus)
if command -v gitstatus >/dev/null 2>&1; then
    source <(gitstatus --script)
fi

#
# Custom Cloud Theme
#

if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='☁'
fi

# Detect SSH session
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE=remote/ssh
else
    case $(ps -o comm= -p $PPID) in
        sshd|*/sshd) SESSION_TYPE=remote/ssh;;
    esac
fi

# Build the prompt
PROMPT_PRE=''
if [[ $SESSION_TYPE == 'remote/ssh' ]]; then
    PROMPT_PRE='%n@%m '
fi

# Main prompt
PROMPT='${PROMPT_PRE}%{$fg_bold[cyan]%}$ZSH_THEME_CLOUD_PREFIX %{$fg[green]%}%p %{$fg[green]%}%c %{$reset_color%}$(git_super_status)%{$fg_bold[red]%}% %{$reset_color%}'

# Git prompt symbols
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_BRANCH_SYMBOL="%{$fg_bold[cyan]%}%{%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[blue]%}%{ ●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{ ✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}%{ ✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{ ↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{ ↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}%{ …%G%}"
ZSH_THEME_GIT_PROMPT_STASH="%{$fg[yellow]%}%{ 󰏗%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Alternative: Simple prompt without git-prompt dependency
# This is a fallback if git_super_status is not available
if ! command -v git_super_status >/dev/null 2>&1; then
    # Simple git branch display
    git_branch() {
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        if [[ -n $branch ]]; then
            echo "%{$fg_bold[cyan]%}[$branch]%{$reset_color%} "
        fi
    }

    # Override prompt to use simple git branch
    PROMPT='${PROMPT_PRE}%{$fg_bold[cyan]%}$ZSH_THEME_CLOUD_PREFIX %{$fg[green]%}%p %{$fg[green]%}%c $(git_branch)%{$fg_bold[red]%}% %{$reset_color%}'
fi

# Right-side prompt (shows exit code if non-zero)
RPS1='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'

# Window/tab title
case $TERM in
    xterm*|rxvt*|screen*|tmux*)
        precmd() {
            print -Pn "\e]0;%n@%m: %~\a"
        }
        preexec() {
            print -Pn "\e]0;%n@%m: $1\a"
        }
        ;;
esac