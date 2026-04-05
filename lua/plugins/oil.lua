return {
  {
    'stevearc/oil.nvim',
    lazy = false, -- Load immediately as default file explorer
    priority = 1000, -- Load very early
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = false,
            }
        })

        -- Set up the key mapping for Oil
        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

        -- Open Oil as default view only when launched with no file arguments
        vim.api.nvim_create_autocmd("VimEnter", {
            pattern = "*",
            callback = function()
                if vim.fn.argc() > 0 then return end
                local has_startup_commands = vim.tbl_contains(vim.v.argv, "-c") or vim.tbl_contains(vim.v.argv, "+")
                if has_startup_commands then return end
                local bufname = vim.api.nvim_buf_get_name(0)
                if bufname ~= "" then return end
                vim.defer_fn(function()
                    vim.cmd('Oil')
                end, 0)
            end
        })
    end,
  },
}
