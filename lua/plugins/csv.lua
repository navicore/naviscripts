return {
  {
    'hat0uma/csvview.nvim',
    ft = { "csv", "tsv" },
    config = function()
      require('csvview').setup()
    end
  }
}
