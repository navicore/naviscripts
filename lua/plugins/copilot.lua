return {
  {
    'github/copilot.vim',
    config = function()
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
        vim.cmd('Copilot disable') -- Disable copilot by default and enable it when needed.
    end
  },
}
