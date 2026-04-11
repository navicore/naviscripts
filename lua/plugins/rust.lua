return {
  {
    'mrcjkb/rustaceanvim',
    lazy = false, -- Must load immediately for rust-analyzer
    version = '^9',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
      end
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>e', function()
              vim.diagnostic.open_float(nil, { border = "rounded" })
            end, opts) -- Floating window with rounded borders
            vim.keymap.set('n', '<leader>q', '<Cmd>Telescope diagnostics<CR>', opts) -- Show diagnostics in a Telescope window
          end
        }
      }
    end
  },
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
  },
}
