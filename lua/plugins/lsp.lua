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
}
