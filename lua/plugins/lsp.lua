return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "williamboman/mason.nvim",
    },
    config = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            format = {
              enable = false,
            },
          },
        },
      })

      -- python
      local lspconfig = require("lspconfig")
      lspconfig.jedi_language_server.setup({})
      lspconfig.pyright.setup({})

      -- other languages
      lspconfig.yamlls.setup({
        filetypes = { "yaml" },
      })
      lspconfig.r_language_server.setup({
        filetypes = { "r", "rmd" },
      })
      lspconfig.awk_ls.setup({
        cmd = { "awk-language-server" },
        filetypes = { "awk" },
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        ui = {
          code_action = "",
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
}
