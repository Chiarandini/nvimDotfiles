require("code_runner").setup({
	mode = 'float',
	float = {
		border = "double", -- rounded, shadow, double
	},
	filetype = {
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt",
		},
		python = "python3 -u",
		typescript = "deno run",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
	},
})

vim.keymap.set("n", "<leader>RT", function()
	require("betterTerm").send(
		require("code_runner.commands").get_filetype_command(),
		1,
		{ clean = false, interrupt = true }
	)
end, { desc = "Excute File" })
