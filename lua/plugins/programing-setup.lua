--  ╔══════════════════════════════════════════════════════════╗
--  ║                       programming                        ║
--  ╚══════════════════════════════════════════════════════════╝

return {
	-- for suggested code compltion
	-- NOTE: COSTS MONEY WITHOUT STUDENT ENTERPRISE GITHUB
	-- {
	-- 	"github/copilot.vim",
	-- },
	{
		"voxelprismatic/rabbit.nvim",
		keys = "<c-t>",
		ft = vim.g.programming_ft,
		config = function()
			require("configs.rabbit")
		end,
	},
	{
		-- context-smart comment adder
		"danymat/neogen",
		keys = {
			{
				"<Leader>c",
				function()
					require("neogen").generate({})
				end,
				desc = "add comment",
				{ noremap = true, silent = true },
			},
		},
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("neogen").setup({
				snippet_engine = "luasnip",
			})
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	-- better around/in operators
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup({})
		end,
	},

	-- For pop-up
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},

	{ -- for prettier quick fix
		"yorickpeterse/nvim-pqf",
		ft = "qf",
		config = function()
			require("pqf").setup()
		end,
	},

	--visuzlize progress of multiple tasks
	-- NOTE: Noice has it's own fidget-like functionality
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("fidget").setup({})
		end,
	},

	--NOTE: trying out snacks version

	--to make it easier to see indentation
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("ibl").setup()
	-- 	end,
	-- },
	-- { -- another indent visualization plugin, gif more aesthetical but doesn't seem to work
	-- 	"Mr-LLLLL/cool-chunk.nvim",
	-- 	event = { "CursorHold", "CursorHoldI" },
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		require("cool-chunk").setup({})
	-- 	end
	-- },

	{ -- to explain regex in floating window
		"tomiis4/Hypersonic.nvim",
		event = "CmdlineEnter",
		cmd = "Hypersonic",
		config = function()
			require("hypersonic").setup({
				-- disable regexing for / and ?
				enable_cmdline = false,
			})
		end,
	},
	-- { -- highlight same variable
	-- 	"RRethy/vim-illuminate",
	-- 	-- event = { "VeryLazy" },
	-- 	cmd = { "IlluminateResumeBuf", "IlluminatePauseBuf" },
	-- 	config = function()
	-- 		require("configs.illuminate")
	-- 	end,
	-- },
	-- NOTE: commented for now since not using TMUX
	{ -- for tmux-integration
		"christoomey/vim-tmux-navigator",
	},

	{ -- inline virtual text showing colour
		"brenoprata10/nvim-highlight-colors",
		ft = vim.g.programming_ft,
		config = function()
			require("configs.highlight-colors")
		end,
	},

	--@DEPRICATED: using raycast or other means
	-- for color picking
	-- {
	-- 	"uga-rosa/ccc.nvim",
	-- 	cmd = { "CccPick" },
	-- 	config = function()
	-- 		require("ccc").setup()
	-- 	end,
	-- },

	{ -- to visualize dense code blocks
		"HampusHauffman/block.nvim",
		cmd = { "Block", "BlockOn", "BlockOff" },
		config = true,
	},
	-- minimap
	-- NOTE: trying neominimap
	-- {
	-- 	"echasnovski/mini.map",
	-- 	version = false,
	-- 	keys = {
	-- 		{
	-- 			"<c-w>m",
	-- 			function()
	-- 				require("mini.map").toggle()
	-- 			end,
	-- 			desc = "toggle minimap",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("mini.map").setup()
	-- 	end,
	-- },
	{ -- immediate lua-code execuion buffer (good for brainstroming)
		"rafcamlet/nvim-luapad",
		cmd = "Luapad",
		config = function()
			require("luapad").setup()
		end,
	},
	{ -- when oppening nvim in a terminal in nvim, opens it in new buffer
		"willothy/flatten.nvim",
		config = true,
		event = "TermOpen",
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		priority = 1001,
	},
	{ -- plugin to manage all types of ways to run programs
		"stevearc/overseer.nvim",
		cmd = { "OverseerRun", "OverseerToggle" },
		config = function()
			require("overseer").setup()
		end,
	},
	{ -- for jupyter notebooks
		"luk400/vim-jukit",
		enabled = false,
		keys = "<leader>np",
	},
	-- WARN: This looks really cool, but couldn't get it to work
	-- { -- run python blocks
	-- 	"dccsillag/magma-nvim",
	-- 	build = ":UpdateRemotePlugins",
	-- 	keys = {
	-- 		{"<LocalLeader>r",  "<cmd>MagmaEvaluateOperator<CR>"   , mode="n"},
	-- 		{"<LocalLeader>rr", "<cmd>MagmaEvaluateLine<CR>"       , mode="n"},
	-- 		{"<LocalLeader>r",  "<cmd><C-u>MagmaEvaluateVisual<CR>", mode="x"},
	-- 		{"<LocalLeader>rc", "<cmd>MagmaReevaluateCell<CR>"     , mode="n"},
	-- 		{"<LocalLeader>rd", "<cmd>MagmaDelete<CR>"             , mode="n"},
	-- 		{"<LocalLeader>ro", "<cmd>MagmaShowOutput<CR>"         , mode="n"},
	-- 	},
	-- },

	{ -- REPL code
		"Vigemus/iron.nvim",
		keys = {
			{ "<leader>rs", "<cmd>IronRepl<cr>" },
			{ "<leader>rr", "<cmd>IronRestart<cr>" },
			{ "<leader>rf", "<cmd>IronFocus<cr>" },
			{ "<leader>rh", "<cmd>IronHide<cr>" },
		},
		cmd = { "IronRepl", "IronHide", "IronFocus", "IronRestart" },
		config = function()
			require("configs.iron")
		end,
	},

	{
		"Bekaboo/deadcolumn.nvim",
		ft = { "python", "lua" },
		config = function()
			require("configs.deadcolumn")
		end,
	},

	{ -- better marks visualization
		"chentoast/marks.nvim",
		event = "BufReadPost",
		config = function()
			require("configs.marks")
		end,
	},

	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{                                     -- a plugin for compiling projects
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
	},
	{ -- a project managing plugin
		"Zeioth/project.nvim",
		keys = {
			{
				"<space>p",
				"<cmd>Telescope projects<cr>",
				desc = "[p]rojects",
			},
		},
		dependency = {
			"nvim-telescope/telescope.nvim",
			-- 'vhyrro/luarocks.nvim',
		},
		config = function()
			require("project_nvim").setup({})
			require("telescope").load_extension("projects")
		end,
	},
	{ -- a test runner
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = { "NeotestRun" }, --NOTE not an actual command, just didn't want to load it
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
					require("neotest-plenary"),
					require("neotest-vim-test")({
						ignore_file_types = { "python", "vim", "lua" },
					}),
				},
			})
		end,
	},
	{
		'AndrewRadev/switch.vim',
		cmd = 'Switch',
	},
	{ -- for more code completions
		"yarospace/dev-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		specs = {
			{
				"folke/snacks.nvim",
				opts = { picker = { enabled = true } },
			},
		},
		---@type Config
		opts = {
			actions = {},

			filetypes = { -- filetypes for which to attach the LSP
				include = {},
				exclude = {},
			},

			builtin_actions = {
				include = {}, -- filetype/category/title of actions to include
				exclude = {}, -- filetype/category/title of actions to exclude or true to exclude all
			},

			override_ui = true, -- override vim.ui.select with dev-tools actions picker
			debug = false, -- extra debug info on errors
			cache = true, -- cache actions at startup (disable when developing actions)
		},
	},

	-- may be interestin
	-- https://www.reddit.com/r/neovim/comments/1epphvh/tailwindtoolsnvim_v030_comes_with_luapattern/

	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim

	-- TODO: wanna decide what I wanna keep
	-- {
	-- more bracket options
	--    "echasnovski/mini.bracketed",
	--    event = "BufReadPost",
	--    config = function()
	-- 	require("mini.bracketed").setup({
	-- 		buffer = { suffix = 'B', options = {} }, -- [b and ]b is for tab switching
	-- 	})
	-- end
	-- },

	--to visually see quick-fix actions
	-- {
	-- 	"kosayoda/nvim-lightbulb",
	-- 	event = "InsertEnter", --User ActuallyEditing
	-- 	dependencies = "antoinemadec/FixCursorHold.nvim",
	-- 	config = function()
	-- 		require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
	-- 	end,
	-- },
}
