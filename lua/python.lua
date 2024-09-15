-- python config
local lspconfig = require('lspconfig')

local on_attach

lspconfig.jedi_language_server.setup {
  on_attach = on_attach,
  init_options = {
    workspace = {
      extraPaths = { },
    },
    completion = {
      disableSnippets = false,
      resolveEagerly = false,
    },
    diagnostics = {
      enable = true,
      didOpen = true,
      didChange = true,
      didSave = true,
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
  end,
})
