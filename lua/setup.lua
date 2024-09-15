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

vim.api.nvim_set_keymap('n', '<Enter>', 'o<Esc><CR>', {noremap = true})

-- Clear search highlights without losing ESC functionality in Lua
vim.api.nvim_set_keymap('n', '<esc>', ':nohlsearch<esc>', { noremap = true, silent = true })

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.g['conjure#filetype#rust'] = false
vim.o.wrap = false
vim.opt.textwidth = 80

-- Heighten the current pane
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':resize +5<CR>', { noremap = true, silent = true })
-- Shorten the current pane
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':resize -5<CR>', { noremap = true, silent = true })

-- Widen the current pane
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
-- Narrow the current pane
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.g.R_assign = 2

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])

require('gitsigns').setup()

vim.g.haskell_tools = {
  hls = {
    on_attach = function(_, _bufnr, ht)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = _bufnr, })
      vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts)
      vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
      vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
    end,
  },
}

-- LSP Diagnostics Options Setup
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })

