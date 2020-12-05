local map = require("utils").map
local opts = {noremap = true, silent = true}

-- leader
vim.g.mapleader = " "

-- ;
map("n", ";", ":", {})

-- redo
map("n", "U", "<C-R>", {})

-- close buffer, not window
map("n", "q", ":bw<CR>", {})

-- switch buffer with alt arrows
map("n", "<A-Down>", "<Cmd>bnext<CR>", opts)
map("n", "<A-Up>", "<Cmd>bprev<CR>", opts)

-- fff
map("n", ";o", ":F %:p:h<CR>", opts)

-- nvim-fzy
map(
  "n",
  "f",
  "<Cmd>lua fzy.execute('fd --hidden --exclude /library --exclude /.origin --exclude /.thugpro --exclude /.cache . ~', fzy.sinks.edit_file)<CR>",
  opts
)
map("n", "b", "<Cmd>lua fzy.actions.buffers()<CR>", opts)

-- nvim-lsp
map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", ";r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>ld", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", opts)
map("n", "[c", ":PrevDiagnosticCycle<CR>", opts)
map("n", "]c", ":NextDiagnosticCycle<CR>", opts)

-- commenter
--vim.api.nvim_command("nnoremap <M-;> :call NERDComment(0,"toggle")<CR>")
--vim.api.nvim_command("vnoremap <M-;> :call NERDComment(0,"toggle")<CR>")
--vim.api.nvim_command("let g:NERDCreateDefaultMappings = 1")
--map("v", "c", ":call NERDComment(0,"toggle")<CR>", opts)
--map("n", "C", ":MultiCommenterToggle<CR>", opts)
--vim.api.nvim_set_keymap("n", "c", "<Leader>c<Space>", {noremap = true, silent = true})

-- formatter
map("n", ";p", ":Format<CR>", opts)

-- minimap
map("n", "m", ":MinimapToggle<CR>", opts)

-- limelight
map("n", "l", ":Limelight<CR>", opts)
map("n", "L", ":Limelight!<CR>", opts)
