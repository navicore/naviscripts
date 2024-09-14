return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      local on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
      end

      lspconfig.jedi_language_server.setup {
        on_attach = on_attach,
        init_options = {
          workspace = {
            extraPaths = { },
          },
          completion = {
            disableSnippets = false,
            resolveEagerly = false,
          },
          diagnostics = {
            enable = true,
            didOpen = true,
            didChange = true,
            didSave = true,
          },
        },
      }

      lspconfig.pyright.setup {
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            },
          },
        },
      }
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,
        },
      })

    end
  },
}
