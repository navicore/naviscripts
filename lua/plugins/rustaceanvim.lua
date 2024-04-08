return {
  "lvimuser/lsp-inlayhints.nvim",
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
          end
        }
      }
    end
  },
}
