return {
	"tpope/vim-abolish",
	event = { "InsertEnter", "CmdlineEnter" },
	ft = { "tex", "norg" },
	config = function()
		require("configs.abolish")
	end,
}
