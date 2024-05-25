local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.color_scheme = 'Relaxed'

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.font_size = 16.0
config.font = wezterm.font 'JetBrains Mono'

return config
