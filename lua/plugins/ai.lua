return {
  -- Copilot LSP backend (suggestions handled by blink.cmp via blink-copilot)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          zet = false,
        },
      })
    end,
  },
}