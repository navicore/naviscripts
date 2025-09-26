#!/usr/bin/env zsh
# 00-init.zsh - Early initialization and OS detection

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Detect OS and set platform-specific variables
case "$OSTYPE" in
  darwin*)
    export IS_MACOS=true
    # Detect homebrew location (M1 vs Intel)
    if [[ -x /opt/homebrew/bin/brew ]]; then
      export HOMEBREW_PREFIX="/opt/homebrew"
    elif [[ -x /usr/local/bin/brew ]]; then
      export HOMEBREW_PREFIX="/usr/local"
    fi

    # Add homebrew to path if found
    if [[ -n "$HOMEBREW_PREFIX" ]]; then
      path=("$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin" $path)
    fi
    ;;

  linux*)
    export IS_LINUX=true
    # Add common Linux paths
    path=("/usr/local/bin" $path)
    ;;

  *bsd*)
    export IS_BSD=true
    ;;
esac

# Add user bin to PATH (universal)
path=("$HOME/bin" "$HOME/.local/bin" $path)

# Load cargo/rust environment early (needed for completions)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Set common environment variables
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# History configuration
export HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
export HISTSIZE=999999
export SAVEHIST=100000
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Directory navigation
setopt AUTO_CD                   # If a command isn't valid, but is a directory, cd to that dir
setopt AUTO_PUSHD                # Make cd push the old directory onto the directory stack
setopt PUSHD_IGNORE_DUPS         # Don't push multiple copies of the same directory
setopt PUSHD_MINUS               # Exchanges the meanings of '+' and '-' when used with a number to specify a directory in the stack

# Completion system settings (before compinit)
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt ALWAYS_TO_END             # Move cursor to the end of a completed word
setopt PATH_DIRS                 # Perform path search even on command names with slashes
setopt AUTO_MENU                 # Show completion menu on a successive tab press
setopt AUTO_LIST                 # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH          # If completed parameter is a directory, add a trailing slash
setopt NO_COMPLETE_ALIASES       # Don't complete aliases (can be problematic)

# General shell behavior
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive shells
setopt NO_BEEP                   # Don't beep on errors
setopt MULTIOS                   # Perform implicit tees or cats when multiple redirections are attempted

# Job control
setopt LONG_LIST_JOBS            # List jobs in the long format by default
setopt AUTO_RESUME              # Attempt to resume existing job before creating a new process
setopt NOTIFY                    # Report status of background jobs immediately

# Globbing
setopt EXTENDED_GLOB             # Use extended globbing syntax
setopt NO_GLOB_DOTS             # * shouldn't match dotfiles. ever.