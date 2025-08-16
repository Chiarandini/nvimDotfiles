--  ╔══════════════════════════════════════════════════════════╗
--  ║                     ===============                      ║
--  ║                     == LSP SETUP ==                      ║
--  ║                     ===============                      ║
--  ╚══════════════════════════════════════════════════════════╝
-- LSP: deals with the static parsing of code. Creates tag blocks, finds errors,
--   gives warning, documentation-hover, go-to-definition,
return {
	{
		"neovim/nvim-lspconfig",
		-- event = 'BufEnter',
		event = "BufReadPre",
		-- event = "VeryLazy",
		keys = { { "<c-w><c-l>", "<cmd>LspInfo<cr>", desc = require("utils.icons").nvim_lsp .. " Info" } },
		dependencies = {
			-- LSP Support
			{ "jay-babu/mason-null-ls.nvim" },
			-- previewing code actions
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				keys = {
					{
						"<c-w><c-m>",
						function()
							require("mason.ui").open()
						end,
						desc = require("utils.icons").mason .. " Mason",
					},
				},
			},
			{ -- for better diagnostics ("opens" all buffers to check for diagnostics then closes them)
				"artemave/workspace-diagnostics.nvim",
			},
			-- {'SmiteshP/nvim-navic'}, -- for LSP breadcrumbs
			{ "williamboman/mason-lspconfig.nvim" },
			{ -- for debugging (must be loaded after mason.nvim)
				"jay-babu/mason-nvim-dap.nvim",
			},
			{ "nvimtools/none-ls.nvim", event = { "BufReadPre", "BufNewFile" }, dependencies = { "mason.nvim" } },
			-- { -- for prettier lsp actions
			-- 	'nvimdev/lspsaga.nvim',
			-- 	event = 'BufReadPost',
			-- 	dependencies = {
			-- 		'nvim-treesitter/nvim-treesitter',
			-- 		'nvim-tree/nvim-web-devicons'
			-- 	},
			-- 	keys = {
			-- 		{'<c-w>o', '<cmd>Lspsaga outline<cr>', desc="LSP outline"},
			-- 	},
			-- 	config = function()
			-- 		require('lspsaga').setup({
			-- 			lightbulb = {
			-- 				sign = false
			-- 			},
			-- 		})
			-- 	end,
			-- },
			{ -- for prettier formatting
				"MunifTanjim/prettier.nvim",
				config = function()
					require("configs.prettier")
				end,
			},
			{ -- outining document
				"simrat39/symbols-outline.nvim",
				config = function()
					require("symbols-outline").setup({
						auto_close = true,
						auto_preview = true,
						autofold_depth = 1,
					})
				end,
			},
			{   -- for neovim development
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				config = function()
					require("lazydev").setup({
						library = {
							-- See the configuration section for more details
							-- Load luvit types when the `vim.uv` word is found
							{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						},
					})
				end,
			},
		},
		config = function()
			require("configs.lsp")
		end,
	},
	{ -- nicer definition peaking
		"dnlhc/glance.nvim",
		event = "VeryLazy",
		config = function()
			require("glance").setup({})
		end,
	},
}
