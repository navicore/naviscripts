return {
  {
    "renerocksai/calendar-vim",
    lazy = false,
  },
  {
    "navicore/zettlekast.nvim",
    lazy = false,
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "mattn/calendar-vim", -- optional
    },
    config = function()
      require("zettlekast").setup({
            -- see Configuration below
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
