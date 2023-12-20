--use {
--'gorbit99/codewindow.nvim',
--config = function()
--local codewindow = require('codewindow')
--codewindow.setup()
--codewindow.apply_default_keybinds()
--end,
--}

--return {
	--"gorbit99/codewindow.nvim",
	--enabled = true,
	--keys = { { "<leader>m", mode = { "n", "v" } } },
	--config = function()
		--local codewindow = require "codewindow"
		--codewindow.setup()
		--codewindow.apply_default_keybinds()
	--end,
--}

--{
	--active_in_terminals = false, -- Should the minimap activate for terminal buffers
	--auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
	--exclude_filetypes = { 'help' }, -- Choose certain filetypes to not show minimap on
	--max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
	--max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
	--minimap_width = 20, -- The width of the text part of the minimap
	--use_lsp = true, -- Use the builtin LSP to show errors and warnings
	--use_treesitter = true, -- Use nvim-treesitter to highlight the code
	--use_git = true, -- Show small dots to indicate git additions and deletions
	--width_multiplier = 4, -- How many characters one dot represents
	--z_index = 1, -- The z-index the floating window will be on
	--show_cursor = true, -- Show the cursor position in the minimap
	--screen_bounds = 'lines' -- How the visible area is displayed, "lines": lines above and below, "background": background color
	--window_border = 'single' -- The border style of the floating window (accepts all usual options)
	--relative = 'win' -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
	--events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' } -- Events that update the code window
--},


--{ -- Minimap
		--"gorbit99/codewindow.nvim",
		
		--keys = {
			--{
				--"<leader>mo",
				--"codewindow.toggle_minimap()",
				--mode = "n",
				--desc = "Toggle Minimap",
			--},
			--{
				--"<leader>mm",
				--"codewindow.toggle_focus()",
				--mode = "n",
				--desc = "Focus Minimap",
			--},
		--},



--return {
	--"gorbit99/codewindow.nvim",
	--keys = {
		--{
			--"<Leader>mm",
			--function()
				--require("codewindow").toggle_minimap()
			--end,
			--desc = "CodeWindow toggle_minimap()",
		--},
	--},
	--opts = {
		--auto_enable = true,
		--exclude_filetypes = { "neo-tree", "terminal", "toggleterm", "qf", "lazy", "mason", "diff", "unite", "fugitive" },
	--},
--}
--



--return {
    --"gorbit99/codewindow.nvim",
    --dependencies = {
        --"nvim-treesitter/nvim-treesitter",
        --"nvim-lua/plenary.nvim",
    --},
    --lazy = true,
    --keys = { "<leader>mm", "<leader>mo" },
    --config = function()
        --local cw = require("codewindow")
        --cw.setup()
        --cw.apply_default_keybinds()
    --end
--}
--
--return { -- Minimap
    --"gorbit99/codewindow.nvim",

    --keys = {
      --{
        --"m",
        --"codewindow.toggle_minimap()",
        --mode = "n",
        --desc = "Toggle Minimap",
      --},
      --{
        --"<leader>mm",
        --"codewindow.toggle_focus()",
        --mode = "n",
        --desc = "Focus Minimap",
      --},
    --},

    --config = function(_, opts)
      --local codewindow = require "codewindow"
      --codewindow.setup(opts)
      --codewindow.apply_default_keybinds()
    --end,

    --opts = {
      --show_cursor = false,
      --screen_bounds = "lines",
      --window_border = "none",
    --},
  --},


--return {
	--"gorbit99/codewindow.nvim",
	--enabled = true,
	--keys = { { "m", mode = { "n", "v" } } },
	--config = function()
		--local codewindow = require "codewindow"
		--codewindow.setup()
		--codewindow.apply_default_keybinds()
	--end,
--}
