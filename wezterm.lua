-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Nancy (terminal.sexy)'
config.color_scheme = 'Solarized (dark) (terminal.sexy)'

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.font_size = 16.0

-- and finally, return the configuration to wezterm
return config
