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
	{
	  "rbong/vim-flog",
	  lazy = true,
	  cmd = { "Flog", "Flogsplit", "Floggit" },
	  dependencies = {
		"tpope/vim-fugitive",
	  },
	},

}
