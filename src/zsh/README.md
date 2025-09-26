# Modular Zsh Configuration

This directory contains a modular zsh configuration system that's portable, maintainable, and easy to customize.

## Structure

Files are numbered to control load order:

- **00-init.zsh** - Early initialization, OS detection, environment setup
- **10-zinit.zsh** - Plugin management with zinit
- **20-aliases.zsh** - Command aliases and helper functions
- **30-prompt.zsh** - Prompt configuration and themes
- **99-local.zsh** - Machine-specific settings (not tracked in git)

## Load Order

1. `~/.zshrc_pre` (if exists) - Very early customization
2. All `*.zsh` files in this directory (in numerical order)
3. `~/.local/bin/env` (if exists) - Local environment variables
4. `~/.zshrc_local` (if exists) - Machine-specific overrides

## Customization

### Adding New Modules

Create a new file with appropriate numbering:
- `05-*.zsh` - Runs after init but before zinit
- `15-*.zsh` - Runs after zinit but before aliases
- `25-*.zsh` - Runs after aliases but before prompt
- `40-*.zsh` - Runs after prompt

### Machine-Specific Settings

1. Copy `99-local.zsh.template` to `99-local.zsh`
2. Add your machine-specific configuration
3. This file is gitignored and won't be committed

### Local Overrides

Use `~/.zshrc_local` for settings that should override the default configuration.

## Environment Variables

Key variables set by this configuration:

- `IS_MACOS`, `IS_LINUX`, `IS_BSD` - OS detection flags
- `HOMEBREW_PREFIX` - Homebrew installation location (macOS)
- `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, `XDG_CACHE_HOME` - XDG base directories

## Debugging

Set `ZSH_DEBUG=1` before sourcing to see debug output:

```bash
ZSH_DEBUG=1 source ~/.zshrc
```

## Migration from Old Configuration

Run the migration script:

```bash
~/naviscripts/migrate_to_modular.sh
```

This will:
1. Backup your existing configuration
2. Test the new modular setup
3. Help you migrate safely

## Tips

- Keep modules focused on a single concern
- Use numbered prefixes to control load order
- Put machine-specific settings in local files (not tracked in git)
- Test changes in a new shell before making them permanent