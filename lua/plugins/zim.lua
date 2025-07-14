return {
  {
    "navicore/zim-sequencer",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "cd engine && cargo build --release",
    config = function()
      require("sequencer").setup()
    end,
  },
  {
    "voldikss/vim-floaterm",
  },
  {
    "navicore/zim-studio-nvim",
    dependencies = {
      "voldikss/vim-floaterm", -- or 'akinsho/toggleterm.nvim'
    },
    config = function()
      require("zim-studio").setup()
    end,
  },
}
