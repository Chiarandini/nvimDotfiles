-- shows the "context" code or section by fixing it at top
-- TODO: replace with breadcrumbs when they come out
return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPost",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
		min_window_height = 10, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
		line_numbers = true,
		multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
		trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
		mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
		-- Separator between context and content. Should be a single character string, like '-'.
		-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
		separator = nil,
		zindex = 20, -- The Z-index of the context window
		-- disable = {'tex', 'latex'},
		-- (fun(buf: integer): boolean) return false to disable attaching
		-- on_attach = function()
		-- 	return vim.bo.filetype ~= 'tex'
		-- end,
	},
	config = function(_, opts)
		require("treesitter-context").setup(opts)
		vim.keymap.set("n", "[oT", ":TSContextEnable<cr>" , {desc = "enabling: TSContext"})
		vim.keymap.set("n", "]oT", ":TSContextDisable<cr>", {desc = "disabling: TSContext"})
		vim.keymap.set("n", "<c-w>[T", ":TSContextEnable<cr>", {desc = "enabling: TSContext"})
		vim.keymap.set("n", "<c-w>]T", ":TSContextDisable<cr>", {desc = "disabling: TSContext"})
	end,
}
