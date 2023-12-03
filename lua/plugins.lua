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
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
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
  --use 'chrisbra/csv.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'derekwyatt/vim-sbt'
  use 'derekwyatt/vim-scala'
  use 'ervandew/screen'
  use 'godlygeek/tabular'

  use 'mattn/gist-vim'
  use 'mattn/webapi-vim'
  use 'navicore/vis.vim'
  use 'navicore/vissort.vim'
  use 'tomtom/tcomment_vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  --use 'vim-pandoc/vim-pandoc'
  --use 'vim-pandoc/vim-pandoc-syntax'
  use 'wannesm/wmgraphviz.vim'
  use 'diepm/vim-rest-console'
  use {'jalvesaq/Nvim-R', branch = 'stable' }

  -- lisp repl stuff
  use 'wlangstroth/vim-racket'
  use 'Olical/conjure'

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'
  use 'mfussenegger/nvim-dap'

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

  -- Completion framework:
  use 'hrsh7th/nvim-cmp'

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'andersevenrud/cmp-tmux'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  use {
    'mrcjkb/haskell-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    branch = '1.x.x', -- recommended
  }

  use 'github/copilot.vim'

  --use 'navicore/lalrpop-syntax-vim'

end)
