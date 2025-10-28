return {
  "ggandor/leap.nvim",
  event = "BufEnter",
  config = function()
    require("leap")
  end,
}
