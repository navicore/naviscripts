return {

  'nvim-treesitter/completion-treesitter',

    config = function()

      -- Treesitter Plugin Setup
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "rust", "toml", "python", "r", "racket", "scheme" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting=false,
        },
        ident = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        }
      }

    end
}
