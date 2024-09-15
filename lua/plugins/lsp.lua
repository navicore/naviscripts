return {

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      'williamboman/mason.nvim',
    },
    config = function()
    end
  },

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

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      local mr = require("mason-registry")
      local function ensure_installed(package)
        if not mr.is_installed(package) then
          mr.get_package(package):install()
        end
      end
      local servers = {
        "pyright",
        "gopls",
        "lua-language-server",  -- This is the correct name for Mason
        "jedi-language-server",
        "black"
      }
      for _, server in ipairs(servers) do
        ensure_installed(server)
      end
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


