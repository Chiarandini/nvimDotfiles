---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "latex", "lua", "vim", "vimdoc", "query", "norg", "markdown", "markdown_inline", "kotlin" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { 'latex' },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
	incremental_selection = { -- Can I make this work only in visual mode?
		enable = true,
		-- keymaps = { -- I never used it, and conflicts with current git setup (pressing enter to commit)
		-- 	init_selection = "<cr>",
		-- 	node_incremental = "<cr>",
		-- 	node_decremental = "<BS>",
		-- },
	},
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = { "norg" },
		--Don't like the look of tree-sitter highlight
		-- disable = {},
		disable = { "latex", "tex" },
	},
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},
	textobjects = {
		select = {
			enable = true,
			disable = {'tex', 'latex'},

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["iC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["aC"] = "@class.outer",

				-- general programming textobjecst
				["av"] = "@parameter.outer", -- v for variable
				["iv"] = "@parameter.inner", -- for variable
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["ar"] = "@return.outer",
				["ir"] = "@return.inner",
				["ac"] = "@comment.outer",
				["ic"] = "@comment.inner",

				-- You can also use captures from other query groups like `locals.scm`
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true of false
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				[">>"] = "@parameter.inner",
				['>i'] = "@item.outer",
			},
			swap_previous = {
				["<<"] = "@parameter.inner",
				['<i'] = "@item.outer",
			},
		},
		move = {
			enable = true,
			-- disable = {'tex', 'latex'},
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {

				[']i'] = "@item.outer",
				["]g"] = "@box_env",
				-- function()
				-- 	if vim.o.filetype == "tex" then
				-- 		return "@box_env"
				-- 	end
				-- 	return "@function.outer"
				-- end,
				["]p"] = "@proof_env",
				["]x"] = "@example_env",
				["]a"] = "@exercise",
				["]c"] = "@chapter",
				["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
				-- [']O'] = "@chapter.outer",
			},
			goto_next_end = {
				["]P"] = "@proof_end",
				["]X"] = "@example_end",
			},
			goto_previous_start = {
				['[i'] = "@item.outer",
				["[g"] = "@box_env",
				["[p"] = "@proof_env",
				["[x"] = "@example_env",
				["[a"] = "@exercise",
				["[c"] = "@chapter",
				-- function()
				-- 	if vim.o.filetype == "tex" then
				-- 		return "@env_name"
				-- 	end
				-- 	return "@function.outer"
				-- end,
				-- ['[O'] = "@chapter.outer",
				-- ['[i'] = "texCmdItem"
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[P"] = "@proof_end",
				["[X"] = "@example_end",
			},
			-- Below will go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			-- Make it even more gradual by adding multiple queries and regex.
			-- goto_next = {
			-- 	["]d"] = "@conditional.outer",
			-- },
			-- goto_previous = {
			-- 	["[d"] = "@conditional.outer",
			-- },
		},
		lsp_interop = {
			enable = true,
			border = "none",
			floating_preview_opts = {},
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},
	},
})
