return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            view_options = {
                show_hidden = false,
            }
        })

        -- Set up the key mapping for Oil
        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

        -- Create the autocommand within the plugin's configuration
        vim.api.nvim_create_autocmd("VimEnter", {
            pattern = "*",
            callback = function()
                if vim.fn.argc() == 0 then
                    vim.defer_fn(function()
                        vim.cmd('Oil')
                    end, 0)
                end
            end
        })
    end,
  },
}
