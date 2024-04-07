return {
  {
    'diepm/vim-rest-console',
    event = "VeryLazy",
    config = function()
      vim.g.vrc_output_buffer_name = '__VRC_OUTPUT.json'
      vim.g.vrc_curl_opts = {
          ['--connect-timeout'] = 5,
          ['--max-time'] = 60,
          ['--ipv4'] = '',
          ['-ks'] = '',
      }
    end,
  },
}

