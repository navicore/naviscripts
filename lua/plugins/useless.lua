return {
  {
    'eandrju/cellular-automaton.nvim',
    config = function()
      vim.keymap.set("n", "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>")
      vim.keymap.set("n", "<leader>cs", "<cmd>CellularAutomaton scramble<CR>")
      vim.keymap.set("n", "<leader>cg", "<cmd>CellularAutomaton game_of_life<CR>")
    end
  }
}
