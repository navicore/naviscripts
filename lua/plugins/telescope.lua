return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope", "Rg" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
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
            "--hidden",
            "--glob", "!.git/*",
          },
          layout_strategy = "flex",
          layout_config = { flex = { flip_columns = 120 } },
          file_ignore_patterns = {},
          path_display = { "truncate" },
          dynamic_preview_title = true,
        },
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        },
      })

      -- Load extensions
      require("telescope").load_extension("media_files")
      -- Load fzf-native for better performance
      pcall(require("telescope").load_extension, "fzf")

      -- Create the Rg command that works like fzf.vim's :Rg
      vim.api.nvim_create_user_command(
        'Rg',
        function(opts)
          require('telescope.builtin').live_grep({
            default_text = opts.args,
            initial_mode = "insert",
          })
        end,
        { nargs = '*', desc = 'Ripgrep search with Telescope' }
      )

      -- Also create some other useful commands
      vim.api.nvim_create_user_command('Files', 'Telescope find_files', { desc = 'Find files with Telescope' })
      vim.api.nvim_create_user_command('Buffers', 'Telescope buffers', { desc = 'List buffers with Telescope' })
      vim.api.nvim_create_user_command('History', 'Telescope oldfiles', { desc = 'File history with Telescope' })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}