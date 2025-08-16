--  ╔══════════════════════════════════════════════════════════╗
--  ║                        Treesitter                        ║
--  ╚══════════════════════════════════════════════════════════╝

-- tree-sitter for better highliting among
return {

	-- treesitter itself
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",

		dependencies = {
			"windwp/nvim-ts-autotag",
			{ -- for vaf, ]m/[m, and so much more! Should really learn more
				-- config happens in tree-sitter.setup itself
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
		-- build = ":TSUpdate",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,

		config = function(_, opts)
			require("nvim-ts-autotag").setup({})
			require("configs.treesitter")
		end,
	},
}
