return {
  {
    'mrcjkb/rustaceanvim',
    event = "VeryLazy",
    version = '^4', -- Recommended
    ft = { 'rust' },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {}
      },
    },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          --highlight = "NonText",
          highlight = "LspInlayHint",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)

            local opts = { noremap=true, silent=true }
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
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
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup({
        lsp = {
            enabled = true,
            on_attach = function(client, bufnr)
                -- the same on_attach function as for your other lsp's
            end,
            actions = true,
            completion = true,
            hover = true,
        },
      })
    end,
  },
}
