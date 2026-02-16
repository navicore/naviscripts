return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'zettlekast', 'rmarkdown', 'rmd' }, -- Only load for markdown files
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('render-markdown').setup({
          file_types = { 'markdown', 'zettlekast', 'rmarkdown', 'rmd', 'copilot-chat' },
      })

      vim.treesitter.language.register('markdown', 'zettlekast')
    end
  }
}