require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.itero"] = {},
		["core.keybinds"] = {
			config = {
				hook = function(keybinds)
					-- Sometimes you may simply want to rebind the Neorg action something is bound to
					-- versus remapping the entire keybind. This remap is essentially the same as if you
					-- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR>")
					-- keybinds.remap_event("norg", "n", "<C-Space>", "core.qol.todo_items.todo.task_done")

					-- Want to move one keybind into the other? `remap_key` moves the data of the
					-- first keybind to the second keybind, then unbinds the first keybind.
					keybinds.remap_key("norg", "i", "<M-CR>", "<S-CR>")
				end,
			},
		},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					home = "~/neorg/work",
				},
				default_workspace = "home",
			},
		},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.export"] = {
			config = {
				export_dir = "export/markdown-export",
			},
		},
		["core.presenter"] = {
			config = {
				zen_mode = "zen-mode",
			},
		},
		["core.latex.renderer"] = {
			config = {
				render_on_enter = true,
			},
		},
	},
})
