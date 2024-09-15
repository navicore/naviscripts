local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Setting runtimepath
vim.opt.runtimepath:append("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Requiring Lua modules for plugins and setup
require('lazy').setup('plugins')
require('setup')
require('python')
require('luacfg')
