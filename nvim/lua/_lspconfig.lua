--local lspconfig = require "lspconfig"
--local configs = require "lspconfig/configs"
--local completion = require "completion"
--local utils = require "utils"

--local on_attach = function(client)
  --completion.on_attach(client)

  --local opts = {noremap = true, silent = true}

  --vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")

  --vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")

  --vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
--end

--require("nlua.lsp.nvim").setup(
--  lspconfig,
--  {
--    on_attach = on_attach
--  }
--)

--configs.svelte = {
--  default_config = {
--stdio"},
--    filetypes = {"svelte"},
--    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
--    settings = {}
--  }
--}

--local servers = {
  --bashls = {},
  --vimls = {},
  --tsserver = {},
  --jsonls = {},
--  clangd = {},
--  svelte = {},
--  jedi_language_server = {},
--  html = {
--    filetypes = {"html", "jinja"}
--  },
--  vuels = {},
  --cssls = {},
--  gopls = {
--    cmd = {"gopls", "serve"},
--    settings = {
--      gopls = {
--        analyses = {
--          unusedparams = true
--        },
--        staticcheck = true
--      }
--    }
--  }
--}

--for server, config in pairs(servers) do
  --lspconfig[server].setup(vim.tbl_deep_extend("force", {on_attach = on_attach}, config))
--end
