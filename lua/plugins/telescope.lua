return {
    -- start telescope
    {
        'nvim-treesitter/nvim-treesitter',
        event = "VeryLazy",
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },
    { 'junegunn/fzf', build = ":call fzf#install()" },
    'junegunn/fzf.vim',
    'sharkdp/fd',
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    {'nvim-telescope/telescope-fzf-native.nvim',
        config = function()
            require('telescope').load_extension('media_files')
            require('telescope').setup {
              extensions = {
                media_files = {
                  -- filetypes whitelist
                  -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                  filetypes = {"png", "webp", "jpg", "jpeg"},
                  -- find command (defaults to `fd`)
                  find_cmd = "rg"
                }
              },
            }
        end,
    },
    'nvim-lua/popup.nvim',
    --'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-media-files.nvim',
  -- end telescope
}
