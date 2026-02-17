-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Editor behavior
vim.opt.wrap = false
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.encoding = "utf8"
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80

-- Search and completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append({ c = true })

-- Spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Files and backup
vim.opt.swapfile = true
vim.opt.directory = vim.fn.expand("~/.vim/swapfiles")
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir/")

-- Appearance
vim.opt.guifont = "Fira Code:h12"

-- Plugin-specific settings
vim.g.csv_nomap_bs = 1
vim.g.csv_nomap_cr = 1
vim.g.csv_nomap_space = 1

vim.g.WMGraphviz_dot = "dot"
vim.g.WMGraphviz_output = "png"
vim.g.WMGraphviz_viewer = "open"

vim.g.ScreenImpl = "Tmux"
vim.g.rustfmt_autosave = 1

vim.g.pandoc_modules_disabled = { "folding" }
vim.g.pandoc_syntax_conceal_use = 0

vim.g.R_assign = 0

vim.g.airline_powerline_fonts = 1

-- Disable clipboard provider on Unix (non-macOS)
if vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0 then
  vim.g.loaded_clipboard_provider = 1
end

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Diagnostic configuration (show messages inline like Rust)
-- Helper function to strip gopls analyzer prefixes
local function format_diagnostic(diagnostic)
  local message = diagnostic.message
  -- Strip known gopls analyzer prefixes if present
  local prefixes = { "shadow", "nilness", "unusedwrite", "unusedparams", "useany" }
  for _, prefix in ipairs(prefixes) do
    local pattern = "^" .. prefix .. ":%s*"
    if message:match(pattern) then
      return message:gsub(pattern, "")
    end
  end
  return message
end

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    source = false,
    prefix = "●",
    format = format_diagnostic,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = false,
    header = "",
    prefix = "",
    format = format_diagnostic,
  },
})

-- Override open_float to ensure format is applied
local orig_open_float = vim.diagnostic.open_float
vim.diagnostic.open_float = function(opts, ...)
  opts = opts or {}
  opts.format = format_diagnostic
  return orig_open_float(opts, ...)
end

vim.keymap.set("n", "<leader>b", "<cmd>CellularAutomaton make_it_rain<CR>")

