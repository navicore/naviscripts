local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

-- Function to merge tables
local function merge_tables(main_table, additional_table)
  for k, v in pairs(additional_table) do
    if type(v) == "table" and type(main_table[k] or false) == "table" then
      merge_tables(main_table[k], v)
    else
      main_table[k] = v
    end
  end
end

-- Load and merge configurations
local modules = {
  'color_scheme',
  'font',
  'keys',
  'padding',
}

for _, module in ipairs(modules) do
  local module_config = require('wezterm_config.' .. module)
  merge_tables(config, module_config)
end

return config
