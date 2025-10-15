return {
  {
    "neovim/nvim-lspconfig",
    lazy = false, -- Load immediately for LSP support
    priority = 100, -- Load early
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "williamboman/mason.nvim",
    },
    config = function()
      -- Load lspconfig to make server configs available
      require("lspconfig")

      -- Now use the new vim.lsp.config API
      -- The configs are provided by nvim-lspconfig but we use vim.lsp.enable

      -- Lua
      if not vim.lsp.config.lua_ls then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("lua_ls", lspconfig_configs.lua_ls.default_config)
      end
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            format = {
              enable = false,
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- Python
      if not vim.lsp.config.jedi_language_server then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("jedi_language_server", lspconfig_configs.jedi_language_server.default_config)
      end
      vim.lsp.enable("jedi_language_server")

      if not vim.lsp.config.pyright then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("pyright", lspconfig_configs.pyright.default_config)
      end
      vim.lsp.enable("pyright")

      -- YAML
      if not vim.lsp.config.yamlls then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("yamlls", lspconfig_configs.yamlls.default_config)
      end
      vim.lsp.config("yamlls", {
        filetypes = { "yaml" },
      })
      vim.lsp.enable("yamlls")

      -- R
      if not vim.lsp.config.r_language_server then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("r_language_server", lspconfig_configs.r_language_server.default_config)
      end
      vim.lsp.config("r_language_server", {
        filetypes = { "r", "rmd" },
      })
      vim.lsp.enable("r_language_server")

      vim.lsp.enable("zls")

      -- AWK
      if not vim.lsp.config.awk_ls then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("awk_ls", lspconfig_configs.awk_ls.default_config)
      end
      vim.lsp.config("awk_ls", {
        cmd = { "awk-language-server" },
        filetypes = { "awk" },
      })
      vim.lsp.enable("awk_ls")

      -- C/C++
      if not vim.lsp.config.clangd then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("clangd", lspconfig_configs.clangd.default_config)
      end
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })
      vim.lsp.enable("clangd")

      -- Go
      if not vim.lsp.config.gopls then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("gopls", lspconfig_configs.gopls.default_config)
      end
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
              nilness = true,
              unusedwrite = true,
              useany = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
        on_attach = function(client, bufnr)
          -- Enable inlay hints like Rust
          if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          local opts = { noremap = true, silent = true }
          local buf_set_keymap = vim.api.nvim_buf_set_keymap

          -- Match Rust keymaps
          buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
          buf_set_keymap(bufnr, 'n', '<leader>q', '<Cmd>Telescope diagnostics<CR>', opts)
        end,
      })
      vim.lsp.enable("gopls")
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
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
    event = "LspAttach",
    opts = {
      -- options
    },
  },
}
