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
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
    -- config = function()
    --   vim.keymap.set("n", "<leader>cp", "<cmd>CopilotChatToggle<cr>")
    --
    -- end
  },
  {
    "navicore/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    config = function()
      vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionToggle<cr>")
      vim.keymap.set("n", "<leader>cp", "<cmd>CopilotChatToggle<cr>")
      require("codecompanion").setup({
        openai = function()
          return require("codecompanion.adapters").use("openai", {
            env = {
              api_key = "OPENAI_API_KEY",
            },
          })
        end,
        strategies = {
          inline = {
            adapter = "openai",
          },
          chat = {
            adapter = "openai",
          },
        },
      })
    end,
  }
}
