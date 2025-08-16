-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/folke/flash.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	-- opts = {
	-- 	search =
	-- 	{
	-- 		mode = "fuzzy",
	-- 		-- incremental = true,
	-- 	},
	-- 	jump = {
	-- 		-- autojump = true,
	-- 	},
	-- 	label = {
	-- 		before = true,
	-- 		after = false,
	-- 	},
	-- 	modes = {
	-- 		search = {
	-- 			enabled = false,
	-- 		},
	-- 		char = {
	-- 			enabled = false,
	-- 		},
	-- 	},
	-- },
	-- stylua: ignore
	keys = {
		-- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		-- { "<c-s>", mode = { "n","i" }, function() require("flash").jump() end, desc = "Flash" },
	-- 	{ "<leader>t", mode = { "n" }, function() require("flash").treesitter_search() end, desc = "Treesitter select with Flash" },
	},
}
