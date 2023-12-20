local wo = vim.wo
local o = vim.o
local bo = vim.bo
local g = vim.g

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- main
g.mapleader = " "
o.clipboard = "unnamedplus"
o.ve = "onemore"
o.shortmess = "atI"
g.python_host_prog = '/usr/local/bin/python'
g.python3_host_prog = '/usr/local/bin/python3.8'
o.mouse = "a"
o.backspace = "indent,start"
g.autochdir = true

-- interface
vim.api.nvim_command("colorscheme wal")
wo.cursorline = false
wo.number = true
wo.relativenumber = false
wo.cursorcolumn = false
o.termguicolors = false
o.title = true
o.titlestring = "%t %y"
--o.number = true
o.ruler = false
o.updatetime = 50
o.hidden = true
wo.wrap = false
o.showmode = false
o.laststatus = 0

-- list/fill chars
o.list = true
o.fillchars = 'vert: '
--o.listchars = 'tab:┆·,trail:·,precedes:,extends:'
o.listchars = table.concat({'tab: ', 'space: ', 'eol: ', 'trail: '}, ',')
--vim.cmd [[augroup TreeSitterFolds]]
--vim.cmd   [[autocmd BufEnter * setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99]]
--vim.cmd [[augroup END]]

-- tabs
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = false
bo.expandtab = false
bo.tabstop = 2
bo.smartindent = true
bo.shiftwidth = 2

-- case check
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- backup, undo, swap options
vim.api.nvim_command("set noswapfile")
o.undofile = false
o.backup = false
o.writebackup = false
o.swapfile = false
