local wezterm = require 'wezterm'

local config = {}

config.enable_wayland = true
config.enable_csi_u_key_encoding = true
config.enable_scroll_bar = true
config.selection_word_boundary = " \t\n{}[]()\"'`,;:<>"

config.mouse_bindings = {
  -- Right-click to paste from the clipboard
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action.PasteFrom("Clipboard")
  },
  -- Middle-click to paste from the primary selection
  {
    event = { Down = { streak = 1, button = "Middle" } },
    mods = "NONE",
    action = wezterm.action.PasteFrom("PrimarySelection")
  },
  -- Ctrl-Shift-C to copy to the clipboard
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "CTRL|SHIFT",
    action = wezterm.action.CopyTo("ClipboardAndPrimarySelection")
  },
  -- Default selection
  {
    event = { Drag = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.ExtendSelectionToMouseCursor("Word")
  },
  {
    event = { Drag = { streak = 2, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.ExtendSelectionToMouseCursor("SemanticZone")
  },
  {
    event = { Drag = { streak = 3, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.ExtendSelectionToMouseCursor("Cell")
  },
}

return config
