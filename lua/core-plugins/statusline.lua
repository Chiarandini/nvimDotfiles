--prefered satusline
--(tabline for nice tabs, disable all other features)
return {
	{-- trying out heirline
		'rebelot/heirline.nvim',
		event = 'UIEnter',
		config = function()
			require('configs.heirline')
		end
	}
	-- {
	-- 	'nvim-lualine/lualine.nvim',
	-- 	event = 'UIEnter',
	-- 	dependencies =
	-- 	{
	-- 		{ 'nvim-tree/nvim-web-devicons', lazy = true },
	-- 		-- {'kdheepak/tabline.nvim',
	-- 		-- config = function()
	-- 		-- 	require'tabline'.setup {enable = false}
	-- 		-- end },
	-- 		-- WARN: might be creating too many threads, trying lsp-progress
	-- 		-- { 'chrisgrieser/nvim-dr-lsp' },
	-- 		{
	-- 			'linrongbin16/lsp-progress.nvim',
	-- 			dependencies = { 'nvim-tree/nvim-web-devicons' },
	-- 			config = function()
	-- 				require('lsp-progress').setup({})
	-- 			end
	-- 		},
	-- 		{ -- harpoon UI component
	-- 			'letieu/harpoon-lualine',
	-- 		},
	-- 		{ -- adds many useful UI components
	-- 			'Mr-LLLLL/lualine-ext.nvim',
	-- 		}
	--
	-- 	},
	-- 	config = function()
	-- 		require('configs.lualine')
	-- 	end
	-- }
}
