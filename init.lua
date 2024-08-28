-- begin legacy config

vim.o.syntax = "on"
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
vim.o.completeopt = "menuone,noselect"
vim.g.WMGraphviz_dot = 'dot'
vim.g.WMGraphviz_output = 'png'
vim.g.WMGraphviz_viewer = 'open'
vim.o.autoread = true
vim.o.statusline = "%#warningmsg#"
vim.o.statusline = "%*"
vim.g.ScreenImpl = 'Tmux'

vim.o.undofile = true
vim.g.rustfmt_autosave = 1
vim.g.pandoc_modules_disabled = {"folding"}
vim.g.pandoc_syntax_conceal_use = 0
vim.g.R_assign = 0
vim.o.textwidth = 80
if vim.fn.has('unix') and not vim.fn.has('macunix') then
    vim.g.loaded_clipboard_provider = 1
end
vim.o.clipboard = "unnamedplus"
vim.o.encoding = "utf8"
vim.g.airline_powerline_fonts = 1
vim.o.guifont = "Fira Code:h12"

-- Mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope media_files<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<F4>', ':w<CR>:make<CR>:copen<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', ':ALEFix<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR><CR>', {noremap = true})
vim.api.nvim_set_keymap('x', '.', ':normal .<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>`^', {noremap = true})

-- end legacy config

vim.api.nvim_set_keymap('n', '<Enter>', 'o<Esc><CR>', {noremap = true})

-- Clear search highlights without losing ESC functionality in Lua
vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<esc>', { noremap = true, silent = true })

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

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

-- non-netrw browser opener
local function open_external(file)
    local sysname = vim.loop.os_uname().sysname:lower()
    local jobcmd
    if sysname:match("windows") then
        jobcmd = ("start %s"):format(file)
    else
        -- Note sure if this is correct. I just copied it from the other answers.
        jobcmd = { "open", file }
    end
    local job = vim.fn.jobstart(jobcmd, {
        -- Don't kill the started process when nvim exits.
        detach = true,

        -- Make relative paths relative to the current file.
        cwd = vim.fn.expand("%:p:h"),
    })
    -- Kill the job after 5 seconds.
    local delay = 5000
    vim.defer_fn(function()
        vim.fn.jobstop(job)
    end, delay)
end
vim.keymap.set("n", "gx", function()
    open_external(vim.fn.expand("<cfile>"))
end)

-- Requiring Lua modules for plugins and setup
require('lazy').setup('plugins')
require('setup')

