return {

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  'neovim/nvim-lspconfig',

  'nvim-treesitter/completion-treesitter',

  'tpope/vim-sleuth',

  -- GIT stuff --
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  'ryanoasis/vim-devicons',
  'aklt/plantuml-syntax',
  'christoomey/vim-tmux-navigator',
  'derekwyatt/vim-sbt',
  'ervandew/screen',
  'godlygeek/tabular',

  'mattn/gist-vim',
  'mattn/webapi-vim',
  'navicore/vis.vim',
  'navicore/vissort.vim',
  'tomtom/tcomment_vim',
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  'wannesm/wmgraphviz.vim',
  'diepm/vim-rest-console',
  'jalvesaq/Nvim-R',

  -- lisp repl stuff
  'wlangstroth/vim-racket',
  'Olical/conjure',

  -- rust
  'rust-lang/rust.vim',
  'mfussenegger/nvim-dap',
  {
  'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },

  -- golang
  'ray-x/go.nvim',
  'ray-x/guihua.lua', -- recommended if need floating window support

  -- theme
  'EdenEast/nightfox.nvim',

  {
    'mrcjkb/haskell-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    branch = '1.x.x', -- recommended
  },

}
