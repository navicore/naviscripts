return {
  {
    "renerocksai/calendar-vim",
    lazy = false,
  },
  {
    "navicore/telekasten.nvim",
    lazy = false, -- Load immediately for leader z commands
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope.nvim",
      "renerocksai/calendar-vim",
    },
    config = function()
      require("telekasten").setup({
        media_previewer = "chafa-previewer",
        home = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet"),
        templates = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates"),
        new_note_filename = "uuid-title",
        filename_space_subst = "_",
        uuid_type = "%Y-%m-%d-%H%M",
        template_new_note = vim.fn.expand(
          "~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates/base_note.md"
        ),
        template_new_daily = vim.fn.expand(
          "~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates/daily.md"
        ),
        template_new_weekly = vim.fn.expand(
          "~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates/weekly.md"
        ),
      })

      -- Launch panel if nothing is typed after <leader>z
      vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

      vim.keymap.set("n", "<leader>zs", "<cmd>Telekasten search_notes<CR>")
      vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
      vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
      vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
      vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
    end,
  },
  {
    "navicore/nvim-reminders",
    lazy = false, -- Load immediately for leader zr commands
    config = function()
      -- require('reminders').setup({
      --   paths = { '~/git/navicore/zet' },
      --   --recursive_scan = true,
      -- })
      require("reminders").setup()
      vim.keymap.set("n", "<leader>zr", "<cmd>ReminderScan<CR>")
      vim.keymap.set("n", "<leader>zre", "<cmd>ReminderEdit<CR>")
    end,
  },
  {
    "navicore/navireader",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make install",  -- Automatically builds Rust binary
    lazy = false,  -- Load immediately to register commands
    config = function()
      require("navireader").setup({
        -- Optional: override zet path (auto-detects ~/git/USERNAME/zet by default)
        -- zet_path = vim.fn.expand("~/my-custom-path/zet"),
      })
      -- Load Telescope extension separately to avoid conflicts
      require("telescope").load_extension("navireader")
    end,
  }
}
