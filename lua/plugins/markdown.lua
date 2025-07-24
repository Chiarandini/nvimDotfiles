return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"Kicamon/markdown-table-mode.nvim",
		ft = "markdown",
		config = function()
			require("markdown-table-mode").setup()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		config = function()
			require("render-markdown").setup({})
		end,
	},
}
