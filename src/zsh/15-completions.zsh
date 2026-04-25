#!/usr/bin/env zsh
# 15-completions.zsh - Cached completion loading
#
# Static completions are cached to files on first run.
# Run `regen-completions` after upgrading tools to refresh.

ZSH_COMP_CACHE="$XDG_CACHE_HOME/zsh/completions"
[[ -d "$ZSH_COMP_CACHE" ]] || mkdir -p "$ZSH_COMP_CACHE"

# Source a cached completion, generating the cache if missing.
# Usage: cached_completion <name> <command...>
cached_completion() {
  local name="$1"; shift
  local cache="$ZSH_COMP_CACHE/$name.zsh"
  if [[ ! -f "$cache" ]]; then
    if (( $+commands[$1] )); then
      "$@" > "$cache" 2>/dev/null
    else
      return 0
    fi
  fi
  source "$cache"
}

# Regenerate all cached completions
regen-completions() {
  rm -f "$ZSH_COMP_CACHE"/*.zsh
  echo "Cleared completion cache, reloading..."
  source "${ZSH_CONFIG_DIR}/15-completions.zsh"
  echo "Regenerated $(ls -1 "$ZSH_COMP_CACHE"/*.zsh 2>/dev/null | wc -l) completions"
}

# Tools present on all systems
cached_completion zim      zim completions zsh
cached_completion seqc     seqc completions zsh
cached_completion seqlings seqlings completions zsh

#these should be in ~/.zshrc_local
#cached_completion zimhide  zimhide completions zsh
#cached_completion navipod  navipod generate-completion zsh

# Dynamic completions (context-dependent, must not be cached)
(( $+commands[just] )) && source <(just --completions zsh)
