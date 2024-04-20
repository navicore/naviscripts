return {
  -- 'mfussenegger/nvim-dap',
  -- --'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  -- {
  --   'theHamsta/nvim-dap-virtual-text',
  --   config = function()
  --     require("nvim-dap-virtual-text").setup()
  --   end,
  -- },
  -- 'nvim-neotest/nvim-nio',
  -- {
  --   'rcarriga/nvim-dap-ui',
  --   dependencies = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'},
  -- },
  'kristijanhusak/vim-dadbod-completion',
  'tpope/vim-dadbod',
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }
}
