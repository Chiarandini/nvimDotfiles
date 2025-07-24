return
{
	{ -- forbetter refactoring. Read README for interaction with debugging.
		"ThePrimeagen/refactoring.nvim",
		cmd = "Refactor",
		keys = {
			{ "<leader>re", function() require('refactoring').refactor('Extract Function') end, mode='v', desc = "extract" },
			{ "<leader>rf",  ":Refactor extract_to_file ",      mode = "x",          desc = "extract to file" },
			{ "<leader>rv",  ":Refactor extract_var ",          mode = "x",          desc = "extract var" },
			{ "<leader>ri",  ":Refactor inline_var",            mode = { "n", "x" }, desc = "inline var" },
			{ "<leader>rb",  ":Refactor extract_block",         mode = "n",          desc = "extract block" },
			{ "<leader>rf", ":Refactor extract_block_to_file", mode = "v",          desc = "block to file" },
		},
		config = true,
	},
}
