return {

  -- lisp repl stuff
  {
    'wlangstroth/vim-racket',
    event = "VeryLazy",
  },

  {
    'Olical/conjure',
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
