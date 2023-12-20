local map = require("utils").map
local opts = {noremap = true, silent = true}

-- leader
vim.g.mapleader = " "

-- ;
map("n", ";", ":", {})

-- Pages in half
map("n", "PageUp", "<C-u>", {})
map("n", "PageDown", "<C-d>", {})

-- redo
map("n", "U", "<C-R>", {})

-- close buffer, not window
map("n", "q", ":bw<CR>", {})

-- switch buffer with alt arrows
map("n", "<A-Right>", "<Cmd>bnext<CR>", opts)
map("n", "<A-Left>", "<Cmd>bprev<CR>", opts)

-- nvim-tree.lua
vim.keymap.set("n", ";o", "<CMD>NvimTreeFocus<CR>", { desc = "open tree" })
vim.keymap.set("n", "e", "<CMD>NvimTreeToggle<CR>", { desc = "open tree" })

--nvim-fzy
map(
	"n",
	"f",
	"<Cmd>lua fzy.execute('fd --hidden --exclude /library --exclude /.origin --exclude /.thugpro --exclude /.cache . ~', fzy.sinks.edit_file)<CR>",
	opts
)
map("n", "b", "<Cmd>lua fzy.actions.buffers()<CR>", opts)

-- nvim-lsp
--map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
--map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--map("n", ";r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--map("n", "<leader>ld", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", opts)
--map("n", "[c", ":PrevDiagnosticCycle<CR>", opts)
--map("n", "]c", ":NextDiagnosticCycle<CR>", opts)

--dont copy replaced text
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })

-- commenter
map("v", "-", ":call nerdcommenter#Comment(\"n\", \"Toggle\")<CR>", opts)
map("n", "-", ":call nerdcommenter#Comment(\"n\", \"Toggle\")<CR>", opts)

-- formatter
map("n", ";p", ":Format<CR>", opts)

-- minimap
--map("n", ";m", ":MinimapToggle<CR>", opts)
--codewindow.toggle_minimap()
    --keys = {
      --{
        --"m",
        --"codewindow.toggle_minimap()",
        --mode = "n",
        --desc = "Toggle Minimap",
      --},
		--}
--vim.keymap.set('n', 'm', codewindow.toggle_minimap())
vim.keymap.set("n", "m", function () require("codewindow").toggle_minimap() end)
