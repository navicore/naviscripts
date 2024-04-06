return {

  {'williamboman/mason.nvim',

    config = function()
      require("mason").setup({
          ui = {
              icons = {
                  package_installed = "",
                  package_pending = "",
                  package_uninstalled = "",
              },
          }
      })
    end

  },
  {'williamboman/mason-lspconfig.nvim',

    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true,
        ensure_installed = {
          "awk_ls",
          "bashls",
          "java_language_server",
          "lua_ls",
          "pyright",
          "jedi_language_server",
          "r_language_server",
          "rust_analyzer",
          "taplo",
        },
      }
      require("mason-lspconfig").setup_handlers {
          function (server_name)
              require("lspconfig")[server_name].setup {}
          end,
      }
    end

  },

  {'neovim/nvim-lspconfig',
  },

}
