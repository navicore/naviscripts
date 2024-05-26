local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.color_scheme = 'Relaxed'

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.font_size = 16.0
config.font = wezterm.font 'JetBrains Mono'

config.keys = {
    -- Resize pane mappings
    {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6B"}},
    {key="UpArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6A"}},
    {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6C"}},
    {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6D"}},
}

return config
