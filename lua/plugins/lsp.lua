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
          "jedi_language_server",
          "lua_ls",
          "pyright",
        },
      }
      require("mason-lspconfig").setup_handlers {
          function (server_name)
              require("lspconfig")[server_name].setup {}
          end,
          ['rust_analyzer'] = function() end, -- do not let mason configure rust_analyzer
      }
    end

  },

  {'neovim/nvim-lspconfig'},

  {'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        ui = {
            code_action = ''
        }
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },

  {'lvimuser/lsp-inlayhints.nvim'},

}
