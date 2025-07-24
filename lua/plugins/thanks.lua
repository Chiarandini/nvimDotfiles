return {
	"jsongerber/thanks.nvim",
	event = "VeryLazy",
	config = function()
		require("thanks").setup({
			star_on_install = true,
			star_on_startup = false,
			ignore_repos = {},
			ignore_authors = {},
			unstar_on_uninstall = true,
			ask_before_unstarring = true,
		})
	end,
}
