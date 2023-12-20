local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end
	
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)
	
	vim.opt.rtp:prepend(lazy.path)
	
	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

-- that was setup, now we load

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	--{'gorbit99/codewindow.nvim'},
	{ -- Minimap
		"gorbit99/codewindow.nvim",
		
    --keys = {
      --{
        --"<leader>m",
        --"codewindow.toggle_minimap()",
        --mode = "n",
        --desc = "Toggle Minimap",
      --},
      --{
        --"<leader>m",
        --"codewindow.toggle_focus()",
        --mode = "n",
        --desc = "Focus Minimap",
      --},
    --},
		
		config = function(_, opts)
			local codewindow = require "codewindow"
			codewindow.setup(opts)
			codewindow.apply_default_keybinds()
		end,
		
		opts = {
			show_cursor = true,
			screen_bounds = "background",
			window_border = "none",
			use_lsp = true,
			use_treesitter = true,
			auto_enable = true,
			minimap_width = 12,
			exclude_filetypes = { "neo-tree", "terminal", "toggleterm", "qf", "lazy", "mason", "diff", "unite", "fugitive" },
			width_multiplier = 6,
		},
	},
	{'nvim-tree/nvim-web-devicons'},
	--{
		--'stevearc/oil.nvim',
		--opts = {},
		---- Optional dependencies
		--dependencies = { "nvim-tree/nvim-web-devicons" },
	--},
	{'nvim-tree/nvim-tree.lua'},
	{'nvim-lua/completion-nvim'},
	{'nvim-lua/diagnostic-nvim'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'mhartington/formatter.nvim'},
	--{'junegunn/limelight.vim'},
	{'preservim/nerdcommenter'},
	{'mfussenegger/nvim-fzy'},
	{'nvim-treesitter/nvim-treesitter'},
	{'psliwka/vim-smoothie'},
	{'nvim-lua/plenary.nvim'},
})
