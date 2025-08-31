--  ╔══════════════════════════════════════════════════════════╗
--  ║                   Better file edditing                   ║
--  ╚══════════════════════════════════════════════════════════╝

-- More advanced example that also highlights diagnostics:
return {
	--https://www.reddit.com/r/neovim/comments/yj2php/lua_alternative_to_vimmatchup/
	--upgrades % key
	{
		"andymass/vim-matchup",
		event = "InsertEnter", -- User ActuallyEditing
		init = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},


	-- WARN: Can't eliminate ySS and ySs overlap, trying new plugin
	--for surround options
	-- {
	-- 	"tpope/vim-surround",
	-- 	event = "VeryLazy",
	-- },

	{ -- https://github.com/kylechui/nvim-surround/blob/main/lua/nvim-surround/config.lua
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "ys",
					normal_cur = "yc", -- was yss
					normal_line = "yS",
					normal_cur_line = "yC", -- was ySS
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
					change_line = "cS",
				},
			})
		end
	},

	--<c-n> in visual mode for multiple cursors
	-- Tutorial: vim -Nu path/to/visual-multi/tutorialrc
	{
		"mg979/vim-visual-multi",
		-- keys = {
		-- 	{'<c-n>',mode = {"i"}},
		-- },
		event = "InsertEnter",
		-- config = function()
		-- setup custom mappings, see :help g:VM_maps
		-- vim.g.VIM_maps = {}

		--If you don't want it enabled in normal mode
		-- vim.g.VM_maps['Find Under'] = ''
		-- end
	},

	--  delete extra white space
	{
		"mcauley-penney/tidy.nvim",
		event = 'VeryLazy',
		-- event = "BufWritePre",
		config = function()
			vim.keymap.set("n", "<leader>te", require("tidy").toggle, { desc = "tidy toggle" })
			require("configs.tidy")
		end,
	},
	{
		'mcauley-penney/visual-whitespace.nvim',
		config = true,
		keys = { 'v', 'V', '<C-v>' }, -- optionally, lazy load on visual mode keys
	},

	-- better "." feature
	"tpope/vim-repeat",

	{ -- for good bulk editing
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ -- for nice little side scroll bar with minimal LSP info (Satellite may eventually replace)
		'petertriho/nvim-scrollbar',
		event = "VeryLazy",
		config = function()
			require('configs.scrollbar')
		end
	}
	-- 	-- TODO: only issue is T is remapped in v,

}
