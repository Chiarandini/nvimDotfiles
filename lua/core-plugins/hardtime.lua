return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	cmd=  'Hardtime',
	config = function()
		require("hardtime").setup({
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
		   restriction_mode = "hint", -- block or hint
			disable_mouse = false,
		})
	end,
}
