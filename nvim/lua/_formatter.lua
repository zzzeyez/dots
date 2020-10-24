local api = vim.api

local prettier = {
  prettier = function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", api.nvim_buf_get_name(0)},
      stdin = true
    }
  end
}

require("format").setup(
  {
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    css = prettier,
    scss = prettier,
    html = prettier,
    svelte = prettier,
    vue = prettier,
    lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  }
)
