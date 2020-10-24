local lsp = require "nvim_lsp"
local configs = require "nvim_lsp/configs"
local util = require "nvim_lsp/util"
local utils = require "utils"

local on_attach = function(client)
  require "diagnostic".on_attach(client)
  require "completion".on_attach(client)

  local opts = {noremap = true, silent = true}
  utils.map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  utils.map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  utils.map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  utils.map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  utils.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  utils.map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  utils.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  utils.map(
    "n",
    "<leader>ld",
    "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>",
    opts
  )
  utils.map("n", "[c", ":PrevDiagnosticCycle<CR>", opts)
  utils.map("n", "]c", ":NextDiagnosticCycle<CR>", opts)
end

require("nlua.lsp.nvim").setup(
  lsp,
  {
    on_attach = on_attach
  }
)

configs.svelte = {
  default_config = {
    cmd = {"svelteserver", "--stdio"},
    filetypes = {"svelte"},
    root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
    settings = {}
  }
}

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
