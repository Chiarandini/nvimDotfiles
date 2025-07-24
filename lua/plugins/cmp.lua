---@diagnostic disable: missing-fields
--  ╔══════════════════════════════════════════════════════════╗
--  ║                     ===============                      ║
--  ║                     == CMP SETUP ==                      ║
--  ║                     ===============                      ║
--  ╚══════════════════════════════════════════════════════════╝
--
-- CMP: sets up the pop-up window with all the completion sources (ex.
-- 	 text,snippets, function-completion, etc.

-- return {}
-- autocompletion engine
return{'hrsh7th/nvim-cmp',
	event = {'InsertEnter', 'CmdlineEnter'},
	dependencies ={
		{'hrsh7th/cmp-nvim-lsp'},                -- cmp has lsp autocompletion
		{'hrsh7th/cmp-nvim-lua'},                -- for lua work
		{'f3fora/cmp-spell'},                    -- for spelling
		{'hrsh7th/cmp-path'},                    -- for path completion
		{'hrsh7th/cmp-git'},                     -- for git completion
		{'hrsh7th/cmp-calc'},                    -- for calculator
		{'hrsh7th/cmp-cmdline'},                 -- for cmdline completion
		{'saadparwaiz1/cmp_luasnip' },           -- required for config
		{'hrsh7th/cmp-buffer'},                  -- for buffer words
		-- {'hrsh7th/cmp-emoji'},                -- to more easily add emoji's
		{'chrisgrieser/cmp-nerdfont'},           -- nerdfont icons
		{"windwp/nvim-autopairs"},               -- for good cross-integartion
		-- NOTE: This is also handled by Noice, if you happen to use it
		{'hrsh7th/cmp-nvim-lsp-signature-help'}, -- for signature help pop-up
		{'KadoBOT/cmp-plugins',                  -- to see plugins (mainly from online, ex. type floke/ or tpope)
		  config = function()
			require("cmp-plugins").setup({
			  files = { ".*\\.lua" }  -- default
			  -- files = { "plugins.lua", "some_path/plugins/" } -- Recommended: use static filenames or partial paths
			})
		  end,
		},
		{-- for fuzzy filepath finding
			'tzachar/cmp-fuzzy-path',
			dependencies = {'tzachar/fuzzy.nvim'},
		},
		{ -- end <auto-complete else if, else>
			 'doxnit/cmp-luasnip-choice',
			config = function()
				require('cmp_luasnip_choice').setup({
					auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
				});
			  end,
		},
		{ -- required for vimtex
			'micangl/cmp-vimtex',
			config = function()
				require('cmp_vimtex').setup({
				additional_information = {
					info_in_menu = true,
					info_in_window = true,
					info_max_length = 60,
					match_against_info = true,
					symbols_in_menu = true,
				},
				bibtex_parser = {
					enabled = true,
				},
			})
			end
		},
	},
	config = function()
		require('configs.cmp')
	end
}
