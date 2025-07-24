require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "anthropic",
		},
		inline = {
			adapter = "anthropic",
		},
	},
	adapters = {
		anthropic = function()
			return require("codecompanion.adapters").extend("anthropic", {
				env = {
					--@WARN: this would be better to add to my environment so as to not
					--need to have sensitive information in my config.
					api_key = require('secrets').anthropic.api_key,
				},
			})
		end,
	},
})

vim.cmd("cabbrev cc CodeCompanion")
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat<cr>", {desc = "[a]i [c]hat"})
-- vim.cmd("cabbrev ccc CodeCompanionChat<cr>")
