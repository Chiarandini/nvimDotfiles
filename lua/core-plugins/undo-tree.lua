return {
	{ --large undo tree with diff
		"jiaoshijie/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<c-w><c-u>", function() require('undotree').toggle() end , desc = "Toggle Undo Tree" },
		},
		config = function()
			require('configs.undo-tree')
		end,
		dependencies = { "nvim-lua/plenary.nvim", },
	}

}



--large undo tree with diff
-- {
-- 	"mbbill/undotree",
-- 	cmd = "UndotreeToggle",
-- 	keys = {
-- 		{ "<leader>u",  function() vim.cmd.UndotreeToggle() end, desc = "Toggle Undo Tree" },
-- 		{ "<c-w><c-u>", function() vim.cmd.UndotreeToggle() end, desc = "Toggle Undo Tree" },
-- 	},
-- 	init = function()
-- 		vim.g.undotree_SetFocusWhenToggle = 1
-- 	end,
-- },
