return {
  {
    "navicore/footnote.nvim",
    lazy = false, -- Load immediately for status line
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("footnote").setup({
        -- Optional configuration
        sources = {
          dictionary = {
            enabled = true,
            api_url = "https://api.dictionaryapi.dev/api/v2/entries/en/",
          },
          wikipedia = {
            enabled = true,
            api_url = "https://en.wikipedia.org/api/rest_v1/page/summary/",
          },
        },
        keymaps = {
          lookup = "<leader>fl", -- Default keymap for lookup
        },
      })
    end,
  }
}
