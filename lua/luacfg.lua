local lspconfig = require('lspconfig')

local on_attach

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  filetypes = { "lua" },
  cmd = { "lua-language-server" },  -- This should match the executable name
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}
