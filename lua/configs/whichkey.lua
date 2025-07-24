local icons = require("utils.icons")
local opts = {
	---@type false | "classic" | "modern" | "helix"
	preset = "modern",
	-- Delay before showing the popup. Can be a number or a function that returns a number.
	---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
	-- delay = 1500,
	delay = function(ctx)
		return ctx.plugin and 0 or 1500
	end,
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
	},
	icons = {
		group = "",
	},
	---@type wk.Win.opts
	win = {
		-- no_overlap = true,
		-- border = "shadow",  -- none, single, double, shadow
		-- position = "bottom", -- bottom, top
		title = true,
		title_pos = "center",
		-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = {1, 2}, -- extra window padding [top/bototm, right/left]
		-- winblend = 0,       -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000,      -- positive value to position WhichKey above other floating windows.
	},
}

-- setup how long before whichKey shows up.
vim.o.timeout = true
vim.o.timeoutlen = 1500

local wk = require("which-key")
wk.setup(opts)
wk.add({
	{
		mode = { "n", "v" },
		{"[" , icon = {icon = icons.toggle_on, color = "yellow"}, group = "toggleOn" },
		{"]" , icon = {icon = icons.toggle_off, color = "yellow"}, group= "toggleOff" },
		{"[o" , icon = {icon = icons.options_on, color = "yellow"}, group= "Options (on)" },
		{"]o" , icon = {icon = icons.options_off, color = "yellow"}, group= "Options (off)" },
		{"<space>" , icon = {icon = icons.search, color = "yellow"}, group= "Search" },
		{"<space>g" , icon = {icon = icons.grep, color = "orange"}, group= "Grep" },
		{"<space>G" , icon = {icon = icons.git, color = "orange"}, group= "Git" },
		{"<space>h" , icon = {icon = icons.fish, color = "blue"}, group= "Harpoon" },
		{"<space>f" , icon = {icon = icons.find, color = "azure"}, group= "Find" },
		{"<space>c" , icon = {icon = icons.config, color = "yellow"}, group= "Config" },
		{"<space>d" , icon = {icon = icons.diagnostics, color = "red"}, group= "Diagnostics" },
		{"<space>e" , icon = {icon = icons.vim, color = "green"}, group= "Editor Files" },
		{"<space>l" , icon = {icon = icons.nvim_lsp, color = "azure"}, group= "LSP" },
		{"<space>w" , icon = {icon = icons.wiki, color = "blue"}, group= "Wiki" },
		{"<space>s" , icon = {icon = icons.session, color = "purple"}, group= "Session" },
		{"<space>q" , icon = {icon = icons.wrench, color = "blue"}, group= "quickfix (Trouble)" },
		{"<space>t" , icon = {icon = icons.toc, color = "blue"}, group= "table of content" },
		{"<space>r" , icon = {icon = icons.pencil, color = "blue"}, group= "resume" },
		{"<space>D" , icon = {icon = icons.debug, color = "red"}, group= "Debug" },
		{"<space>fd" , icon = {icon = icons.documents, color = "blue"}, group= "[f]ind [d]ocuments" },
		-- ["<space>T"] = { name = "+Terminal" },

		-- special symbols
		{"g",  icon = icons.plus, group = "lsp/gcc/other" },
		{"<c-w>",  icon = icons.window, group = "window" },
		{"<c-w>[",  icon = icons.window, group = "open window.." },
		{"<c-w>]",  icon = icons.window, group = "close window.." },

		-- window symbols
		{"<c-w>l",  icon = icons.lazy, group = "Lazy" },
		{"<c-w>s",  icon = {icon = icons.plus, color = "red"}, group = "Statusline" },
		-- {"<c-w><c-u>",  icon = icons.undo, "undo" },
		-- {"<c-w><c-t>",  icon = icons.bars, group = "Neo Tree" },

		-- <leader> + action
		{"<leader>",  icon = {icon = icons.action, color = "blue"}, group = "action" },
		{"<space>o",  icon = {icon = icons.landplot, color = "blue"}, group = "Obsidian" },
		{"<leader>o",  icon = {icon = icons.landplot, color = "blue"}, group = "Obsidian" },
		{"<leader>m",  icon = {icon = icons.map, color = "blue"}, group = "minimap" },
		{"<leader>p",  icon = {icon = icons.Function, color = "blue"}, group = "profiler" },
		{"<leader>b",  icon = {icon = icons.box, color = "blue"}, group = "box" },
		{"<leader>f",  icon = {icon = icons.format, color = "red"}, group = "format" },
		{"<leader>B",  icon = {icon = icons.tab, color = "azure"}, group = "Buffer" },
		{"<leader>r",  icon = {icon = icons.refactor, color = "yellow"}, group = "refactor" },
		{"<leader>t",  icon = {icon = icons.question_shard, color = "yellow"}, group = "toggle" },
		{"<leader>z",  icon = {icon = icons.zenMode, color = "yellow"}, group = "ZenMode" },
		{"<leader>h",  icon = {icon = icons.git, color = "yellow"}, group = "hunk/git" },
		{"<leader>d",  icon = {icon = icons.debug, color = "red"}, group = "Debug" },
		{"<leader>R",  icon = {icon = icons.run, color = "yellow"}, group = "Run" },
	},
})
-- wk.add(opts.defaults)
