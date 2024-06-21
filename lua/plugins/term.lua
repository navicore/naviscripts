return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require("toggleterm").setup {
        --direction = "horizontal",
        direction = "float",
        -- use leader t to toggle terminal
        open_mapping = [[<leader>t]],
        shade_filetypes = {},
        shade_terminals = true,
        shade_factor = 1,
      }
    end
  },
}
