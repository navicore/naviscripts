return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = { telekasten = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
  },
  {
    "robitx/gp.nvim",
    config = function()
      vim.keymap.set("n", "<leader>c", "<cmd>GpChatToggle<cr>")
      local conf = {
        -- For customization, refer to Install > Configuration in the Documentation/Readme
        providers = {
          openai = {
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = os.getenv("OPENAI_API_KEY"),
          },
        }
      }
      require("gp").setup(conf)
      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  }
}
