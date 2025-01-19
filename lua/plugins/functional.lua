return {

  -- lisp repl stuff
  {
    'wlangstroth/vim-racket',
    event = "VeryLazy",
  },

  {
    'Olical/conjure',
    event = "VeryLazy",
    config = function()
      vim.g['conjure#extract#tree_sitter#enabled'] = true
    end

  },

}
