-- toggle joining and splitting code
--toggling set in unimpaired
return {
	'Wansmer/treesj',
	keys = {
		{'[j', function() require('treesj').join() end,  desc = "[j]oin lines (*not* split)" },
		{']j', function() require('treesj').split() end, desc = "un[j]oin lines (split)" },
	},
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	config = function()
		require('configs.treesj')
	end
	--config = function()
		-- local tsj = require('treesj')
		-- local langs = {--[[ configuration for languages ]]}
	--end
}
