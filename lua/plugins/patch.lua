return {
  {
    "navicore/patch-seq.nvim",
    ft = "seq",
    opts = {
      on_attach = function(_, bufnr)
        local opts = { noremap=true, silent=true }
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float(nil, { border = "rounded" })<CR>', opts) -- Floating window with rounded borders
        buf_set_keymap(bufnr, 'n', '<leader>q', '<Cmd>Telescope diagnostics<CR>', opts) -- Show diagnostics in a Telescope window
      end
    },
  },
  {
    "navicore/seq-lisp.nvim",
    lazy = false, -- Load immediately as default file explorer
    event = "BufReadPre *.slisp",
    opts = {},
  }
}
