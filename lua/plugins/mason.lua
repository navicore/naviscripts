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
        --"pyright",
        "gopls",
        "lua-language-server",  -- This is the correct name for Mason
        "jedi-language-server",
        "black"
      }
      for _, server in ipairs(servers) do
        ensure_installed(server)
      end
    end
  },
}
