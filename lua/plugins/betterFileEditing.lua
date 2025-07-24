--  ╔══════════════════════════════════════════════════════════╗
--  ║                   Better file edditing                   ║
--  ╚══════════════════════════════════════════════════════════╝

-- More advanced example that also highlights diagnostics:
-- local function jumpWihDiagnostic()
-- 	require("flash").jump({
-- 		matcher = function(win)
-- 			---@param diag Diagnostic
-- 			return vim.tbl_map(function(diag)
-- 				return {
-- 					pos = { diag.lnum + 1, diag.col },
-- 					end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
-- 				}
-- 			end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
-- 		end,
-- 		action = function(match, state)
-- 			vim.api.nvim_win_call(match.win, function()
-- 				vim.api.nvim_win_set_cursor(match.win, match.pos)
-- 				vim.diagnostic.open_float()
-- 			end)
-- 			state:restore()
-- 		end,
-- 	})
-- end
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
	--see startup time
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	--  delete extra white space
	{
		"mcauley-penney/tidy.nvim",
		event = "BufWritePre",
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

	-- { -- enhanced /? and f,t,F,T
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	--   -- stylua: ignore
	--   keys = {
	-- 	-- { "S", mode = { "n" }, jumpWihDiagnostic, desc = "Flash" },
	-- 	{ "S", mode = { "n" }, function() require('flash').jump() end, desc = "Flash" },
	-- 	-- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	-- 	{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	-- 	{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	-- 	{ "<c-w>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	--   },
	-- },
}
