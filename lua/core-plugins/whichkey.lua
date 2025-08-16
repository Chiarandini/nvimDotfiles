-- to more easily remember what key mappings do what
-- plugins that are included:
-- 1. 'chentoast/marks.nvim',
-- 2. Registers
-- 3. Presets
-- 4. Spelling
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = {
			'echasnovski/mini.icons'
		},
		-- defaults: https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
		config = function(_, opts)
			require('configs.whichkey')
		end,
	},
}
