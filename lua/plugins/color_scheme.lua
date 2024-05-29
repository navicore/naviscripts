return {

    -- {
    --   'sainnhe/sonokai',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     -- Optionally configure and load the colorscheme
    --     -- directly inside the plugin declaration.
    --     vim.g.sonokai_enable_italic = true
    --     vim.g.sonokai_style = 'atlantis'
    --     vim.cmd.colorscheme('sonokai')
    --   end
    -- },

    {
      'EdenEast/nightfox.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme('Nordfox')
        --vim.cmd.colorscheme('Nightfox')
      end
    },
}

