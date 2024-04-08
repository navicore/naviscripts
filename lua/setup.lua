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

vim.cmd("colorscheme terafox")

vim.opt.termguicolors = true
vim.g.R_assign = 2

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])

require('gitsigns').setup()

-- golang
require('go').setup()
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

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


