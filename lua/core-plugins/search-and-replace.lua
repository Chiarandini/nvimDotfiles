-- for swapping text, and better bulk renaming
-- see muren.nvim-muren.nvim-configuration for defaults
return {
	{"AckslD/muren.nvim",
	cmd = "MurenToggle",
	keys = { { "<c-w><c-r>", "<cmd>MurenToggle<cr>", desc='Muren Replace' }, },
	config = function()
		require("muren").setup({
			two_step = true,
			patterns_width = 30,
			patterns_height = 10,
			options_width = 20,
			preview_height = 40,
			-- window positions
			anchor = "top", -- Set to one of:
			-- 'center' | 'top' | 'bottom' | 'left' | 'right' | 'top_left' | 'top_right' | 'bottom_left' | 'bottom_right'
		})
	end},
	-- {
	-- 	'nvim-pack/nvim-spectre',
	-- 	cmd = 'Spectre',
	-- 	keys = { { "<c-w><c-s>", "<cmd>Spectre<cr>", desc = 'Spectre Replace' }, },
	-- 	config = function()
	-- 		require('configs.spectre')
	-- 	end,
	-- }
	{
		"MagicDuck/grug-far.nvim",
		cmd = {"GrugFar", "GrugFarWithin"},
		keys = {{"<c-w><c-s>", function() require('grug-far').open({ transient = true }) end, desc='grep replace'}},
		config = function()
			require('grug-far').setup({})
	    end
	}
}
