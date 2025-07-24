---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = { preset = "default" },

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	-- (Default) Only show the documentation popup when manually triggered
	completion = {
		menu = {
			border = "rounded",
		},
		-- ghost_text = {
		-- 	enabled = true,
		-- },
		documentation = {
			auto_show = true,
			-- window = {
			-- 	border = "rounded",
			-- },
		},
	},
	signature = { enabled = true },
	-- snippets = {
	-- 	preset = "luasnip",
	-- 	expand = function(snippet)
	-- 		require("luasnip").lsp_expand(snippet)
	-- 	end,
	-- 	active = function(filter)
	-- 		if filter and filter.direction then
	-- 			return require("luasnip").jumpable(filter.direction)
	-- 		end
	-- 		return require("luasnip").in_snippet()
	-- 	end,
	--
	-- 	jump = function(direction)
	-- 		require("luasnip").jump(direction)
	-- 	end,
	-- },
	cmdline = {
		enabled = true,
		-- use 'inherit' to inherit mappings from top level `keymap` config
		keymap = { preset = "cmdline" },
		sources = function()
			local type = vim.fn.getcmdtype()
			-- Search forward and backward
			if type == "/" or type == "?" then
				return { "buffer" }
			end
			-- Commands
			if type == ":" or type == "@" then
				return { "cmdline" }
			end
			return {}
		end,
		-- completion = {
		-- 	trigger = {
		-- 		show_on_blocked_trigger_characters = {},
		-- 		show_on_x_blocked_trigger_characters = {},
		-- 	},
		-- 	list = {
		-- 		selection = {
		-- 			-- When `true`, will automatically select the first item in the completion list
		-- 			preselect = true,
		-- 			-- When `true`, inserts the completion item automatically when selecting it
		-- 			auto_insert = true,
		-- 		},
		-- 	},
		-- 	-- Whether to automatically show the window when new completion items are available
		-- 	menu = { auto_show = true },
		-- 	-- Displays a preview of the selected item on the current line
		-- 	ghost_text = { enabled = true },
		-- },
	},
	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer", "vimtex", "cmdline", "spell" },
		-- add the extra providers that are _not_ default
		providers = {
			-- luasnip = {
			-- 	name = "luasnip",
			-- 	module = "blink_luasnip",
			--
			-- 	score_offset = -3,
			--
			-- 	---@module 'blink_luasnip'
			-- 	---@type blink_luasnip.Options
			-- 	opts = {
			-- 		use_show_condition = false, -- disables filtering completion candidates
			-- 		show_autosnippets = true,
			-- 		show_ghost_text = false, -- whether to show a preview of the selected snippet (experimental)
			-- 	},
			-- },
			vimtex = {
				name = "vimtex",
				module = "blink.compat.source",
				score_offset = 30,
				opts = {
					should_show_items = function()
						return vim.tbl_contains({ "tex", "latex" }, vim.o.filetype)
					end,
				},
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
			spell = {
				name = "Spell",
				module = "blink-cmp-spell",
				opts = {
					-- EXAMPLE: Only enable source in `@spell` captures, and disable it
					-- in `@nospell` captures.
					enable_in_context = function()
						local curpos = vim.api.nvim_win_get_cursor(0)
						local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
						local in_spell_capture = false
						for _, cap in ipairs(captures) do
							if cap.capture == "spell" then
								in_spell_capture = true
							elseif cap.capture == "nospell" then
								return false
							end
						end
						return in_spell_capture
					end,
				},
			},
		},
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
