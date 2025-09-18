return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
       { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  'tpope/vim-sleuth',

  -- GIT stuff --
  {
    'mattn/gist-vim',
    event = "VeryLazy",
  },

  {
    'tpope/vim-fugitive',
    event = "VeryLazy",
  },
  'tpope/vim-rhubarb',
  'ryanoasis/vim-devicons',
}
