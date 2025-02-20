return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function ()
      require("mini.ai").setup { }
      -- require("mini.surround").setup { } -- s conflicts with search
      -- require("mini.operators").setup { }
      -- require("mini.pairs").setup { }
      -- require("mini.bracketed").setup { }
      -- require("mini.files").setup { }
    end
  },
}
