return {
	-- {
	-- 	"vhyrro/luarocks.nvim",
	-- 	priority = 1001, -- this plugin needs to run before anything else
	-- 	event = 'VeryLazy',
	-- 	opts = {
	-- 		rocks = { "magick" },
	-- 	},
	-- },
	{
		"nvim-neorg/neorg",
		dependencies = {
			-- "nvim-lua/plenary.nvim",
			-- "vhyrro/luarocks.nvim",
			"3rd/image.nvim",
		},
		-- build=false,  -- HACK: here just until the lua5.1 warning disapears
		keys = {
			{ '<space>ww', '<cmd>Neorg index<cr>',              desc = 'open [N]eorg wiki' },
			{ '<space>wt', '<cmd>tabe<cr><cmd>Neorg index<cr>', desc = 'open [N]eorg wiki (new tab)' },
			{ '<space>wv', '<cmd>vs<cr><cmd>Neorg index<cr>',   desc = 'open [N]eorg wiki (vsplit)' },
			{ '<space>wr', '<cmd>Neorg return<cr>',             desc = 'Close all Neorg Buffers' },
		},
		cmd = 'Neorg',
		ft = { "norg" },
		-- options for neorg. This will automatically call `require("neorg").setup(opts)`
		config = function()
			require('configs.neorg')
		end
	},
}
