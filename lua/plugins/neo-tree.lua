return { -- better file explorer



-- WARN: Weird save behavior: If the Neo-Tree is open and is at a certain directory, and
-- the file you are edditing is in a different directory, it will _save the file to the
-- directory neo-tree is open on_. This keep happening even if the pwd is different!!
--
--
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "main",
	-- 	keys = {
	-- 		-- { "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "open neo-tree" },
	-- 		{ "<c-t>",      "<cmd>Neotree toggle<cr>", desc = "open neo-tree" },
	-- 		{ "<c-w>t",      "<cmd>Neotree toggle<cr>", desc = "open neo-tree" },
	-- 		{ "<c-s-t>",    "<cmd>Neotree reveal<cr>", desc = "open cur file in neo-tree" },
	-- 		{ "<c-w>g", "<cmd>Neotree float git_status<cr>", desc = "gitstatus in dir" }, -- hg to be consistent with gitsigns
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- backend plugin
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim", -- UI library (also used by Notify and noice)
	-- 		-- "3rd/image.nvim",
	-- 		"s1n7ax/nvim-window-picker",
	-- 	},
	-- 	config = function()
	-- 		require('configs.neo-tree')
	-- 	end,
	-- },
}
