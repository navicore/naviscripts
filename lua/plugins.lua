-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'neovim/nvim-lspconfig'

  use 'nvim-treesitter/completion-treesitter'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use 'tpope/vim-sleuth'

  -- GIT stuff --
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'ryanoasis/vim-devicons'
  use 'aklt/plantuml-syntax'
  use 'christoomey/vim-tmux-navigator'
  use 'derekwyatt/vim-sbt'
  use 'ervandew/screen'
  use 'godlygeek/tabular'

  use 'mattn/gist-vim'
  use 'mattn/webapi-vim'
  use 'navicore/vis.vim'
  use 'navicore/vissort.vim'
  use 'tomtom/tcomment_vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'wannesm/wmgraphviz.vim'
  use 'diepm/vim-rest-console'
  use {'jalvesaq/Nvim-R'}

  -- lisp repl stuff
  use 'wlangstroth/vim-racket'
  use 'Olical/conjure'

  -- rust
  use 'rust-lang/rust.vim'
  use 'mfussenegger/nvim-dap'
  use {
  'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  }

  -- golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support

  -- start telescope
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use 'sharkdp/fd'
  use 'nvim-lua/plenary.nvim'
  use 'BurntSushi/ripgrep'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  -- end telescope

  -- theme
  use 'EdenEast/nightfox.nvim'

  use {
    'mrcjkb/haskell-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    branch = '1.x.x', -- recommended
  }

  -- Completion framework:
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets", -- WARNING this is probably too much
      'saadparwaiz1/cmp_luasnip',
    }
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'

  --use {'kevinhwang91/nvim-bqf', ft = 'qf'}

end)
