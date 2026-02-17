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

        require('ufo').setup()

        -- Single key fold toggle: Tab opens/closes folds in normal mode
        vim.keymap.set('n', '<Tab>', 'za', { desc = 'Toggle fold' })

        -- Shift-Tab toggles between all folds closed and all folds open
        local ufo = require('ufo')
        local all_folded = false
        vim.keymap.set('n', '<S-Tab>', function()
            if all_folded then
                ufo.openAllFolds()
            else
                ufo.closeAllFolds()
            end
            all_folded = not all_folded
        end, { desc = 'Toggle all folds' })
    end,
  }
}
