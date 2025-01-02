return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
            'williamboman/mason.nvim',
        },
        config = function()
            require('lspconfig').lua_ls.setup {
                settings = {
                    Lua = {
                        format = {
                            enable = false,
                        },
                    },
                },
            }

            -- begin python
            local lspconfig = require('lspconfig')

            -- Configure Pyright
            lspconfig.pyright.setup{}

            -- Configure Jedi Language Server
            lspconfig.jedi_language_server.setup{}

        end
    },

    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                ui = {
                    code_action = ''
                },
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    },

    { 'lvimuser/lsp-inlayhints.nvim' },

    {
      "j-hui/fidget.nvim",
        opts = {
        -- options
        },
    },
}
