return {
    'kevinhwang91/promise-async',
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()

        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- reminder, use za to toggle fold and zA to toggle recursively
        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        local language_servers = require("lspconfig").util.available_servers()
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
                -- you can add other fields for setting up lsp server in this table
            })
        end
        require('ufo').setup()
    end,
  }
}
