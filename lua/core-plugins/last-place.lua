--remember last place in file
return {
	{
		"ethanholz/nvim-lastplace",
		event = 'BufReadPre',
		config = function()
			require("configs.nvim-lastplace")
		end,
	},
}
