-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- TODO these are NOT loaded automatically as we are not using lazyvim plugin configs -- see the file above for an example of how to load lazy

vim.o.wrap = false

vim.o.syntax = "on"
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.o.nu = true
vim.wo.foldenable = false
vim.filetype.off = true
vim.o.directory = vim.fn.expand("~/.vim/swapfiles")
vim.o.undodir = vim.fn.expand("~/.undodir/")
vim.o.hidden = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.g.csv_nomap_bs = 1
vim.g.csv_nomap_cr = 1
vim.g.csv_nomap_space = 1
vim.filetype.plugin = "on"
vim.filetype.indent = "on"
vim.o.completeopt = "popup"
vim.g.WMGraphviz_dot = "dot"
vim.g.WMGraphviz_output = "png"
vim.g.WMGraphviz_viewer = "open"
vim.o.autoread = true
vim.o.statusline = "%#warningmsg#"
vim.o.statusline = "%*"
vim.g.ScreenImpl = "Tmux"

vim.o.undofile = true
vim.g.rustfmt_autosave = 1
vim.g.pandoc_modules_disabled = { "folding" }
vim.g.pandoc_syntax_conceal_use = 0
vim.g.R_assign = 0
vim.o.textwidth = 80
if vim.fn.has("unix") and not vim.fn.has("macunix") then
  vim.g.loaded_clipboard_provider = 1
end

vim.o.clipboard = "unnamedplus"
vim.o.encoding = "utf8"
vim.g.airline_powerline_fonts = 1
vim.o.guifont = "Fira Code:h12"
