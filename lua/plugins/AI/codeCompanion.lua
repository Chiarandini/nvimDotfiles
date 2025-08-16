return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	config = function()
		require('configs.codeCompletion')
	end,
}
