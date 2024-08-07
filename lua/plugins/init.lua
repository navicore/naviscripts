return {

  'tpope/vim-sleuth',

  -- GIT stuff --
  {
    'tpope/vim-fugitive',
    event = "VeryLazy",
  },
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  'ryanoasis/vim-devicons',
  {
  'aklt/plantuml-syntax',
    event = "VeryLazy",
  },
  'christoomey/vim-tmux-navigator',
  'ervandew/screen',
  {
    'godlygeek/tabular',
    event = "VeryLazy",
  },
  {
    'mattn/gist-vim',
    event = "VeryLazy",
  },
  'mattn/webapi-vim',
  'navicore/vis.vim',
  'navicore/vissort.vim',
  'tomtom/tcomment_vim',
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  {
    'wannesm/wmgraphviz.vim',
    event = "VeryLazy",
  },
  --'jalvesaq/Nvim-R',

  -- lisp repl stuff
  {
    'wlangstroth/vim-racket',
    event = "VeryLazy",
  },
  {
    'Olical/conjure',
    event = "VeryLazy",
  },

  -- rust
  'rust-lang/rust.vim',
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
  },

  {
    'mrcjkb/haskell-tools.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    branch = '1.x.x', -- recommended
  },

}
