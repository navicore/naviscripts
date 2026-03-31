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

  -- CopilotChat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "MeanderingProgrammer/render-markdown.nvim" },
    },
    build = "make tiktoken",
    config = function()
      require("CopilotChat").setup({
        highlight_headers = false,
        separator = "---",
        error_header = "> [!ERROR] Error",
      })
      vim.keymap.set("n", "<leader>cc", "<CMD>CopilotChatToggle<CR>", { desc = "Open Copilot Chat" })
    end,
    keys = {
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}