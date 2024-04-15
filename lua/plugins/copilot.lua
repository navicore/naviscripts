return {
  {
    'github/copilot.vim',
    config = function()
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
        vim.g.copilot_filetypes = {
            ['*'] = true,
            ['markdown'] = false,
            -- ['python'] = true
            -- ['java'] = true
            -- ['lua'] = true
            -- ['rust'] = true
        }
    end
  },
}
