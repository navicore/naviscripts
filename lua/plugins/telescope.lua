return {
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "sharkdp/fd",
  "nvim-lua/plenary.nvim",
  "BurntSushi/ripgrep",
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          layout_strategy = "flex",
          layout_config = { flex = { flip_columns = 120 } },
          -- layout_strategy = 'horizontal',
          -- layout_config = {
          --     preview_width = 0.6,
          -- },
          file_ignore_patterns = {},
          path_display = { "truncate" },
          dynamic_preview_title = true, -- Better debug information
        },
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg",
          },
        },
      })
      require("telescope").load_extension("media_files")
    end,
  },
}
