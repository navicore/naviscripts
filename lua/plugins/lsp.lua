return {

  {
    'neovim/nvim-lspconfig',
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
      -- pre install these but make sure you also configure
      -- them with lspconfig as if they were manuall installed
      local servers = {
        "pyright",
        "gopls",
        "lua-language-server",
        "jedi-language-server"
      }
      for _, server in ipairs(servers) do
        ensure_installed(server)
      end
    end
  },

}
