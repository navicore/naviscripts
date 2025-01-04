return {
  "lommix/bevy_inspector.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("bevy_inspector").setup({
    -- optional custom url
    -- url = "http://127.0.0.1:15702",
    })
  end,
  cmd = { "BevyInspect", "BevyInspectNamed", "BevyInspectQuery" },
  keys = {
    {  "<leader>bia", ":BevyInspect<Cr>", desc = "Lists all entities" },
    {  "<leader>bin", ":BevyInspectNamed<Cr>", desc = "List all named entities" },
    {  "<leader>biq", ":BevyInspectQuery<Cr>", desc = "Query a single component, continues to list all matching entities", },
  },
}
