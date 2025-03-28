return {
  {
    'mrcjkb/rustaceanvim',
    event = "VeryLazy",
    version = '^4', -- Recommended
    ft = { 'rust' },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { 0 })
      end
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true }
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
            buf_set_keymap(bufnr, 'n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float(nil, { border = "rounded" })<CR>', opts) -- Floating window with rounded borders
            buf_set_keymap(bufnr, 'n', '<leader>q', '<Cmd>Telescope diagnostics<CR>', opts) -- Show diagnostics in a Telescope window
          end
        }
      }
    end
  },
  -- rust
  'rust-lang/rust.vim',
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
  },
}
