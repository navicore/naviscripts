return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter", -- Load on insert mode
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind.nvim',
    },
    config = function()

      -- Set highlight for Copilot icon
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

      -- Completion Plugin Setup
      local lspkind = require'lspkind'
      local cmp = require'cmp'

      -- Initialize lspkind with Copilot icon
      lspkind.init({
        symbol_map = {
          Copilot = vim.fn.nr2char(0xf408),  -- GitHub nerd font icon (codepoint F408)
        }
      })

      -- Main completion setup
      cmp.setup({
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
        -- Installed sources (in priority order)
        sources = cmp.config.sources({
          { name = "copilot" },                           -- AI suggestions
          { name = 'nvim_lsp' },                          -- from language server
          { name = 'nvim_lsp_signature_help'},            -- display function signatures
          { name = 'path' },                              -- file paths
        }, {
          { name = 'buffer', keyword_length = 3 },        -- fallback to buffer
        }),
        experimental = {
            ghost_text = false,  -- Disable ghost text to avoid shadow suggestions
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            format = lspkind.cmp_format({
              mode = "symbol_text",
              max_width = 50,
              menu = {
                copilot = "[AI]",
                nvim_lsp = "[LSP]",
                buffer = "[Buf]",
                path = "[Path]",
                nvim_lsp_signature_help = "[Sig]",
              },
              before = function(entry, vim_item)
                -- Make sure Copilot uses the correct kind
                if entry.source.name == "copilot" then
                  vim_item.kind = "Copilot"
                  vim_item.kind_hl_group = "CmpItemKindCopilot"
                end
                return vim_item
              end,
            })
        },
      })

      -- Disable nvim-cmp for command-line to preserve native vim behavior
      -- Comment out to re-enable if you want nvim-cmp command completion

      -- cmp.setup.cmdline('/', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = 'buffer' }
      --   }
      -- })

      -- cmp.setup.cmdline(':', {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = 'path' }
      --   }, {
      --     {
      --       name = 'cmdline',
      --       option = {
      --         ignore_cmds = { 'Man', '!' }
      --       }
      --     }
      --   })
      -- })
    end
  },
}