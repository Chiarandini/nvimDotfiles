local opts = {
	autowidth = { --   |windows.autowidth|
		enable = false, -- off by default
		winwidth = 15, --   |windows.winwidth|
		filetype = { --	 |windows.autowidth.filetype|
			help = 2,
		},
	},
	ignore = { --  |windows.ignore|
		buftype = { "quickfix" },
		filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "mundo" },
	},
	animation = {
		enable = true,
		duration = 100,
		fps = 30,
		easing = "in_out_sine",
	},
}

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false
require("windows").setup(opts)
local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end
vim.keymap.set("n", "<C-w>z", cmd("WindowsMaximize"))
vim.keymap.set("n", "<C-w>_", cmd("WindowsMaximizeVertically"))
vim.keymap.set("n", "<C-w>|", cmd("WindowsMaximizeHorizontally"))
vim.keymap.set("n", "<C-w>=", cmd("WindowsEqualize"))
