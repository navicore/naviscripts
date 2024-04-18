return {
  'mfussenegger/nvim-dap',
  --'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  'nvim-neotest/nvim-nio',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'},
  },
}
