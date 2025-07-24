return {
	{
		"stevearc/oil.nvim",
		keys = { {'<c-w><c-o>', function() require('oil').open_float() end, desc = "Oil Mode"}, },
		cmd = { "Oil" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require('configs.oil')
		end,
	},
}
