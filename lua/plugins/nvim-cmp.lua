return {
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- WARNING this is probably too much
      'saadparwaiz1/cmp_luasnip',
    }
  },
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  {'hrsh7th/nvim-cmp',
    config = function()

      -- Completion Plugin Setup
      local lspkind = require'lspkind'
      local cmp = require'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },
        -- Installed sources:
        sources = {
          { name = "copilot", group_index = 2 },
          { name = 'luasnip', option = { show_autosnippets = true } },
          { name = 'path' },                              -- file paths
          { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
          { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
          { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
          { name = 'buffer', keyword_length = 2 },        -- source current buffer
          { name = 'calc'},                               -- source for math calculation
          { name = 'vim-dadbod-completion' },
        },
        experimental = {
            ghost_text = true,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol',
              maxwidth = 50,
              ellipsis_char = '...',
              show_labelDetails = true,
              symbol_map = { Copilot = "" },
            })
        },
      })

      require 'snippets.lua_snippets'

    end
  },
  'onsails/lspkind.nvim',
}
