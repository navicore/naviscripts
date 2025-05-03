return {
  {
    "navicore/nvim-naviscripts",
    config = function()
      require("naviscripts").setup()
    end,
    cmd = "FormatRustFiles", -- Lazy-load on this command
  },
}

-- {
--     'navicore/nvim-reminders',
--     config = function()
--       -- require('reminders').setup({
--       --   paths = { '~/git/navicore/zet' },
--       --   --recursive_scan = true,
--       -- })
--       require('reminders').setup()
--       vim.keymap.set("n", "<leader>zr", "<cmd>ReminderScan<CR>")
--       vim.keymap.set("n", "<leader>zre", "<cmd>ReminderEdit<CR>")
--     end
--   },
--
