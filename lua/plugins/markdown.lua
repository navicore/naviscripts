return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()

      require('render-markdown').setup({
          file_types = { 'markdown', 'telekasten' },
      })

      vim.treesitter.language.register('markdown', 'telekasten')
    end

  }
}
