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
          "java_language_server",
          "jedi_language_server",
          "lua_ls",
          "pyright",
          -- "hls",
          --"r_language_server",
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

  {'neovim/nvim-lspconfig',

    config = function()
      local nvim_lsp = require('lspconfig')

      nvim_lsp.pyright.setup({
          on_attach = function(client, bufnr)
              local opts = { noremap=true, silent=true }
              local buf_set_keymap = vim.api.nvim_buf_set_keymap
              buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
              buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
              buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
              buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
          end,
      })
    end,

  },

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
