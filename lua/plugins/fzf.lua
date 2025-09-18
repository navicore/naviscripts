return {
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
    lazy = false, -- Load immediately for commands
  },
  {
    "junegunn/fzf.vim",
    lazy = false, -- Load immediately for Rg command
    dependencies = {
      "junegunn/fzf",
      "BurntSushi/ripgrep",
    },
    config = function()
      -- Ensure Rg command is available
      vim.cmd([[
        command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview(), <bang>0)
      ]])
    end,
  },
  "nvim-telescope/telescope-fzf-native.nvim",
}