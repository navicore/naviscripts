return {
  {
    'renerocksai/calendar-vim',
  },
  {
    'renerocksai/telekasten.nvim',
    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'renerocksai/calendar-vim',
    },
    config = function()

      require('telekasten').setup({
        home = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet"),
        templates = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates"),
        new_note_filename = "uuid-title",
        filename_space_subst = '_',
        uuid_type = '%Y-%m-%d-%H%M',
        template_new_note = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates/base_note.md"),
        template_new_daily = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates/daily.md"),
        template_new_weekly = vim.fn.expand("~/git/" .. io.popen("whoami"):read("*a"):gsub("\n", "") .. "/zet/templates/weekly.md"),
      })

      -- Launch panel if nothing is typed after <leader>z
      vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

      -- Easy to remember
      vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
      vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
      vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
      vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")

      -- Impossible to remember
      vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
      vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
      vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
      vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")

      -- Call insert link automatically when we start typing a link
      vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
    end
  },
  {
    'navicore/nvim-reminders',
    config = function()
      require('reminders').setup()
    end
  },
}
