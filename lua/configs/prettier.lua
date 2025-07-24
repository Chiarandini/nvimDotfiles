local prettier = require("prettier")
prettier.setup({
	bin = 'prettierd', -- or `'prettierd'` (v0.23.3+) (instead of prettier)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
