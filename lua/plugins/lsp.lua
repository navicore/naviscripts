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

    config = function()
      require("mason-lspconfig").setup {
        -- automatically install language servers setup below for lspconfig
        automatic_installation = true
      }
    end

  },

  {'neovim/nvim-lspconfig',

    config = function()
      local nvim_lsp = require('lspconfig')

      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set(
        "n",
        "<leader>a",
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          -- or vim.lsp.buf.codeAction() if you don't want grouping.
        end,
        { silent = true, buffer = bufnr }
      )

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      nvim_lsp.jedi_language_server.setup {
        capabilities = capabilities,
      }

      nvim_lsp.bashls.setup {
        capabilities = capabilities,
      }

      nvim_lsp.r_language_server.setup {
        capabilities = capabilities,
      }

      nvim_lsp.java_language_server.setup {
        capabilities = capabilities,
      }

      nvim_lsp.lua_ls.setup {
        capabilities = capabilities,
      }

      -- LSP Diagnostics Options Setup
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ''
        })
      end

      sign({name = 'DiagnosticSignError', text = ''})
      sign({name = 'DiagnosticSignWarn', text = ''})
      sign({name = 'DiagnosticSignHint', text = ''})
      sign({name = 'DiagnosticSignInfo', text = ''})

      vim.diagnostic.config({
          virtual_text = false,
          signs = true,
          update_in_insert = true,
          underline = true,
          severity_sort = false,
          float = {
              border = 'rounded',
              source = 'always',
              header = '',
              prefix = '',
          },
      })

      vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]])

      vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
      vim.opt.shortmess = vim.opt.shortmess + { c = true}
      vim.api.nvim_set_option('updatetime', 300)

      vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]])
    end

  },

}
