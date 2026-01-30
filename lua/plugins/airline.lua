return {
  {
    'vim-airline/vim-airline',
    lazy = false, -- Load immediately for status line
    priority = 1000, -- Load early for UI
    init = function()
      -- Always show error/warning sections even in narrow windows
      vim.g["airline#extensions#default#section_truncate_width"] = {
        b = 60,
        x = 60,
        y = 60,
        z = 45,
        warning = 0,
        error = 0,
      }
    end,
  },
  {
    'vim-airline/vim-airline-themes',
    lazy = false,
  },
}