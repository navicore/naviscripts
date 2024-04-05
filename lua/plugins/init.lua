return require('lazy').setup({

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

  -- Completion framework:
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      "rafamadriz/friendly-snippets", -- WARNING this is probably too much
      'saadparwaiz1/cmp_luasnip',
    }
  },
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'onsails/lspkind.nvim',

  {'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  },
})
