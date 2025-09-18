return {
  'ray-x/guihua.lua', -- recommended if need floating window support
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').goimports()
        end,
        group = format_sync_grp,
      })

      -- gopls config using the new vim.lsp.config API
      require('lspconfig') -- Load to make configs available

      if not vim.lsp.config.gopls then
        local lspconfig_configs = require("lspconfig.configs")
        vim.lsp.config("gopls", lspconfig_configs.gopls.default_config)
      end

      vim.lsp.config("gopls", {
        cmd = {"gopls"},
        filetypes = {"go", "gomod", "gowork", "gotmpl"},
        root_dir = function(fname)
          local util = require('lspconfig.util')
          return util.root_pattern("go.work", "go.mod", ".git")(fname)
        end,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
      vim.lsp.enable("gopls")
      local opts = { noremap=true, silent=true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
}
