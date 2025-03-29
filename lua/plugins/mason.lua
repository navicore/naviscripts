return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      local mr = require("mason-registry")
      local function ensure_installed(package)
        if not mr.is_installed(package) then
          mr.get_package(package):install()
        end
      end
      local servers = {
        "r-languageserver",
        "awk-language-server",
        "pyright",
        "gopls",
        "yaml-language-server",
        "lua-language-server",
        "jedi-language-server",
      }
      for _, server in ipairs(servers) do
        ensure_installed(server)
      end
    end
  },
}
