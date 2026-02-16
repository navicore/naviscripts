return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'zet', 'rmarkdown', 'rmd' }, -- Only load for markdown files
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('render-markdown').setup({
          file_types = { 'markdown', 'zet', 'rmarkdown', 'rmd', 'copilot-chat' },
      })

      vim.treesitter.language.register('markdown', 'zet')
    end
  }
}