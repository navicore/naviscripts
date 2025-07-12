return {
  {
    "navicore/zim-sequencer",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "cd engine && cargo build --release",
    config = function()
      require("sequencer").setup()
    end,
  },
}
