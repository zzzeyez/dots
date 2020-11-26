local wo = vim.wo
local o = vim.o
local bo = vim.bo
local g = vim.g

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
o.list = true
--vim.api.nvim_command("set list")
--vim.api.nvim_command([[set listchars=tab:!·,trail:·]])
-- o.lazyredraw = true
o.list = true
g.listchars = [[tab:|]]
o.fillchars = [[vert: ]]
o.updatetime = 50
o.hidden = true
wo.wrap = false
o.showmode = false
o.laststatus = 0

-- tabs
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
bo.expandtab = true
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
