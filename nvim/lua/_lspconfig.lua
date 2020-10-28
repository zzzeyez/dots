local lsp = require "nvim_lsp"

local on_attach = function(client)
  require "diagnostic".on_attach(client)
  require "completion".on_attach(client)

end

require("nlua.lsp.nvim").setup(
  lsp,
  {
    on_attach = on_attach
  }
)

local servers = {
  html = {},
  tsserver = {},
  cssls = {},
  bashls = {},
  vimls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";")
        },
        completion = {
          keywordSnippet = "Disable"
        },
        diagnostics = {
          enable = true,
          globals = {"vim"}
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  },
}

for server, config in pairs(servers) do
  config.on_attach = on_attach
  lsp[server].setup(config)
end
