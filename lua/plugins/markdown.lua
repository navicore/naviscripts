return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'telekasten', 'rmarkdown', 'rmd' }, -- Only load for markdown files
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('render-markdown').setup({
          file_types = { 'markdown', 'telekasten', 'rmarkdown', 'rmd', 'copilot-chat' },
      })

      vim.treesitter.language.register('markdown', 'telekasten')
    end
  }
}