return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.ai").setup({})
      vim.ui.select = require("mini.pick").ui_select
      require("mini.move").setup({})
      -- require("mini.surround").setup { } -- s conflicts with search
      -- require("mini.operators").setup { }
      -- require("mini.pairs").setup { }
      -- require("mini.bracketed").setup { }
      -- require("mini.files").setup { }
    end,
  },
}
