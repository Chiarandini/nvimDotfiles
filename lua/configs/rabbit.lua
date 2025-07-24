require("rabbit").setup({
	window = {
		title = "Local Call Stack",
	},
	default_keys = {
		close = { -- Default bindings to close Rabbit
			"<Esc>",
			"q",
			"<leader>",
		},

		select = { -- Default bindings to select a buffer
			"<CR>",
		},

		open = { -- Default bindings to open Rabbit
			'<c-t>',
		},

		file_add = { -- Default bindings to add current buffer to persistent history
			"a", -- This would act like Prime's Harpoon, but it isn't implemented yet
		},

		file_del = { -- Default bindings to remove current buffer from persistent history
			"d", -- This would act like Prime's Harpoon, but it isn't implemented yet
		},
	},
})
