--  ╔══════════════════════════════════════════════════════════╗
--  ║                        Git setup                         ║
--  ╚══════════════════════════════════════════════════════════╝

--NOTE: Using lazygit in a terminal. May consider adding tmux to make it nicer.
return {
	{
		event = 'VeryLazy',
		'tpope/vim-fugitive'
	},
	{ -- for nice git visuals
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		keys = {
				{'<c-w>gh', function() require('gitsigns').preview_hunk() end, {desc = 'show hunk on line'}},
				{'<c-w>gb', function() require('gitsigns').toggle_current_line_blame() end, {desc = 'toggle blame'}},
			},
		config = function()
			require("configs.gitsigns")
		end,
	},
	{ -- for quickly generating git-ignore files
		"wintermute-cell/gitignore.nvim",
		cmd = "Gitignore",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- optional: for multi-select
		},
	},
	{
		"SuperBo/fugit2.nvim",
		build=false,  -- HACK: here just until the lua5.1 warning disapears
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"vhyrro/luarocks.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Graph" },
		keys = {
			{ "<c-w>F", mode = "n", "<cmd>Fugit2<cr>", desc = "Fugit" },
		},
	},
	{
		-- optional: for diffview.nvim integration
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- lazy, only load diffview by these commands
		keys = {
			{'<c-w>[d', '<cmd>DiffviewOpen<cr>', {desc = 'open diffView'}},
			{'<c-w>]d', function() require('diffview').close() end, {desc = 'close diffView'}},
		},
		cmd = {
			"DiffviewFileHistory",
			"DiffviewOpen",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
		},
	},
	{
		'akinsho/git-conflict.nvim',
		ft = vim.g.programming_ft,
		version = "*",
		config = true,
	},
	{
	  "rbong/vim-flog",
	  lazy = true,
	  cmd = { "Flog", "Flogsplit", "Floggit" },
	  dependencies = {
		"tpope/vim-fugitive",
	  },
	},

	-- { -- NOTE: trying fugit2
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = "nvim-lua/plenary.nvim",
	-- 	cmd = 'Neogit',
	-- 	config = function()
	-- 		require('neogit').setup()
	-- 	end
	-- },
	-- { --NOTE: trying neogit
	-- 	'tpope/vim-fugitive',
	-- 	'tpope/vim-rhubarb',
	-- }
}
