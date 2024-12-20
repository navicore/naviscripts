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

}
