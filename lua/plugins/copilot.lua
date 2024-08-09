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
      vim.keymap.set("n", "<leader>c", "<cmd>CodeCompanionToggle<cr>")
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
