return {
  {
    "navicore/patch-rexx.nvim",
    ft = "rexx",
    opts = {
      -- Enable inlay hints (off by default)
      inlay_hints = true,
      -- LSP capabilities (optional, for completion plugins)
      capabilities = require("blink.cmp").get_lsp_capabilities(),
      -- on_attach callback (optional)
      on_attach = function(_, bufnr)
        local opts = { noremap=true, silent=true }
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float(nil, { border = "rounded" })<CR>', opts) -- Floating window with rounded borders
        buf_set_keymap(bufnr, 'n', '<leader>q', '<Cmd>Telescope diagnostics<CR>', opts) -- Show diagnostics in a Telescope window
      end,
    },
  },
  {
    "navicore/patch-seq.nvim",
    lazy = false,
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

        local seq_hover = require("util.seq_hover")
        vim.keymap.set('n', '<leader>H', function() seq_hover.toggle(bufnr) end,
          { buffer = bufnr, noremap = true, silent = true, desc = "Toggle pinned seq hover panel" })
      end
    },
  },
  {
    "navicore/seq-lisp.nvim",
    lazy = false,
    event = "BufReadPre *.slisp",
    opts = {},
  }
}
