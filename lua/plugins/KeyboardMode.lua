return {
	"KeyboardMode.nvim",
	dev = true,
	keys = {
		{'<leader>j', function() require('KeyboardMode').toggle() end, desc = "switch to japanese mode"},
	},
	config = function()
		 require('KeyboardMode').setup()
	end
}
