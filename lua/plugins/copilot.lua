return {
  {
    'github/copilot.vim',
    config = function()
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
    end
  },
}
