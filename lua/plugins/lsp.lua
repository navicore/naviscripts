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
          "lua_ls",
          "gopls",
          -- "jedi_language_server",
          -- "pyright",
        },
      }
      require("mason-lspconfig").setup_handlers {
          function (server_name)
              require("lspconfig")[server_name].setup {
                  on_attach = function(client, bufnr)
                      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                      -- Enable completion triggered by <c-x><c-o>
                      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                      -- Mappings.
                      local opts = { noremap=true, silent=true }

                      -- See `:help vim.lsp.*` for documentation on any of the below functions
                      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                      buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                      buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                      buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
                      buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                      buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                      buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                      buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
                      buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
                      buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                      buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                      buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                      buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
                      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
                  end,
                  flags = {
                      debounce_text_changes = 150,
                  }
              }
          end,
          ['rust_analyzer'] = function() end, -- do not let mason configure rust_analyzer
      }
    end

  },

  {'neovim/nvim-lspconfig' },

  {'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        ui = {
            code_action = ''
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },

  {'lvimuser/lsp-inlayhints.nvim'},
}
