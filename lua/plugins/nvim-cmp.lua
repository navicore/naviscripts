return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "fang2hou/blink-copilot",
    },
    event = "InsertEnter",
    opts = {
      keymap = {
        preset = "none",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
          },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
            components = {
              source_name = {
                width = { max = 30 },
                text = function(ctx)
                  local map = {
                    LSP = "[LSP]",
                    copilot = "[AI]",
                    Buffer = "[Buf]",
                    Path = "[Path]",
                    Snippets = "[Snip]",
                  }
                  return map[ctx.source_name] or ("[" .. ctx.source_name .. "]")
                end,
                highlight = "BlinkCmpSource",
              },
            },
          },
        },
      },

      sources = {
        default = { "copilot", "lsp", "path", "snippets", "buffer" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            opts = {
              max_completions = 3,
              max_attempts = 4,
            },
          },
        },
      },
    },
  },
}
