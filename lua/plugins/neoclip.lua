-- for clipboard history (press <c-s-v> in insert mode)
return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
		-- you'll need at least one of these
		{ "nvim-telescope/telescope.nvim" },
	},
	lazy = true,
	config = function()
		require("configs.neoclip")
	end,
}
