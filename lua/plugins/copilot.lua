return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      { 'MeanderingProgrammer/render-markdown.nvim' },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    config = function()
      require('CopilotChat').setup({
        highlight_headers = false,
        separator = '---',
        error_header = '> [!ERROR] Error',
      })
      vim.keymap.set('n', '<leader>cc', '<CMD>CopilotChatToggle<CR>', { desc = 'Open Copilot Chat' })
    end,
    keys = {
      -- Show quick chat prompt
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
      -- Show prompts actions with telescope
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
  }
}
