local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Setting runtimepath
vim.opt.runtimepath:append("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Setting packpath
vim.opt.packpath:append("~/.vim")

-- Requiring Lua modules for plugins and setup
require('plugins')
require('setup')
