return {
  {
    "voldikss/vim-floaterm",
    lazy = false, -- Load immediately as dependency for zim-studio
  },
  {
    "navicore/zim-studio-nvim",
    lazy = false, -- Load immediately for Zim commands
    dependencies = {
      "voldikss/vim-floaterm", -- or 'akinsho/toggleterm.nvim'
    },
    config = function()
      require("zim-studio").setup()
    end,
  },
  -- {
  --   "navicore/zim-sequencer",
  --   lazy = false,
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   build = "cd engine && cargo build --release",
  --   config = function()
  --     require("sequencer").setup()
  --   end,
  -- },
}