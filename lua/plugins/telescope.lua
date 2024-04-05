return {
  -- start telescope
  {
      'nvim-treesitter/nvim-treesitter',
      build = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  },
  { 'junegunn/fzf', build = ":call fzf#install()" },
  'junegunn/fzf.vim',
  'sharkdp/fd',
  'nvim-lua/plenary.nvim',
  'BurntSushi/ripgrep',
  'nvim-telescope/telescope-fzf-native.nvim',
  -- end telescope
}
