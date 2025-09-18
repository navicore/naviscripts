return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "williamboman/mason.nvim",
    },
    config = function()
      -- Using the new vim.lsp.config API (Neovim 0.11+)
      -- Configure servers using vim.lsp.config() then enable with vim.lsp.enable()

      -- Lua
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            format = {
              enable = false,
            },
          },
        },
      })
      vim.lsp.enable('lua_ls')

      -- Python
      vim.lsp.enable('jedi_language_server')
      vim.lsp.enable('pyright')

      -- YAML
      vim.lsp.config('yamlls', {
        filetypes = { "yaml" },
      })
      vim.lsp.enable('yamlls')

      -- R
      vim.lsp.config('r_language_server', {
        filetypes = { "r", "rmd" },
      })
      vim.lsp.enable('r_language_server')

      -- AWK
      vim.lsp.config('awk_ls', {
        cmd = { "awk-language-server" },
        filetypes = { "awk" },
      })
      vim.lsp.enable('awk_ls')
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
