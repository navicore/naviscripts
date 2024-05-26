local wezterm = require 'wezterm'

local config = {}

config.keys = {
    -- Resize pane mappings
    {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6B"}},
    {key="UpArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6A"}},
    {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6C"}},
    {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action{SendString="\x1b[1;6D"}},
}

return config
