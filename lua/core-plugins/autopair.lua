--for good closing features
return { "windwp/nvim-autopairs",
    event = "InsertEnter",
	opts = {
		disable_filetype = { "TelescopePrompt" , "tex" },
	},
	config = function (_, opts)
		require('nvim-autopairs').setup(opts)
	end
}
