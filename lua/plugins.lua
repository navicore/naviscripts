-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use 'nvim-treesitter/completion-treesitter'

  use 'tpope/vim-sleuth'

  -- GIT stuff --
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  }

  --use 'mattn/calendar-vim'
  --use 'ervandew/supertab'
  --use 'leafgarland/typescript-vim'
  --use 'pangloss/vim-javascript'
  use 'ryanoasis/vim-devicons'
  use 'aklt/plantuml-syntax'
  use 'chrisbra/csv.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'derekwyatt/vim-sbt'
  use 'derekwyatt/vim-scala'
  use 'ervandew/screen'
  --use 'fatih/vim-go'
  use 'godlygeek/tabular'

  use 'mattn/gist-vim'
  use 'mattn/webapi-vim'
  use 'navicore/vis.vim'
  use 'navicore/vissort.vim'
  use 'rust-lang/rust.vim'
  use 'tomtom/tcomment_vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'dense-analysis/ale'
  use 'wannesm/wmgraphviz.vim'
  use 'diepm/vim-rest-console'
  use 'brandonbloom/vim-factor'

  use {'neoclide/coc.nvim', branch = 'release'}
  use {'jalvesaq/Nvim-R', branch = 'stable' }

  -- golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support
  use 'neovim/nvim-lspconfig'

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

  use 'EdenEast/nightfox.nvim'

end)
