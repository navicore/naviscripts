return {
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
    lazy = false, -- Load immediately
  },
  {
    "junegunn/fzf.vim",
    lazy = false, -- Load immediately for commands
    cmd = { "Rg", "Files", "Buffers", "Colors", "Ag", "Lines", "BLines", "Tags", "BTags", "Marks", "Windows", "History" },
    dependencies = {
      "junegunn/fzf",
    },
    init = function()
      -- Make sure ripgrep is the preferred grep program
      if vim.fn.executable('rg') == 1 then
        vim.o.grepprg = 'rg --vimgrep --smart-case --hidden'
        vim.o.grepformat = '%f:%l:%c:%m'
      end
    end,
    config = function()
      -- Load fzf.vim plugin to ensure all commands and completions are available
      vim.cmd('runtime! plugin/fzf.vim')

      -- The plugin should provide these commands automatically, but let's ensure Rg exists
      if vim.fn.exists(':Rg') == 0 then
        vim.cmd([[
          command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)
        ]])
      end

      -- Additional fzf settings
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
      vim.g.fzf_preview_window = { 'right:50%:hidden', '?' }

      -- Enable command completion for Rg and other fzf commands
      vim.cmd([[
        command! -bang -nargs=* -complete=dir Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview({'dir': <q-args>}), <bang>0)
      ]])
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}