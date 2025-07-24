-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1


local function yankOptions(state)
	-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
	-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
	local api = require("nvim-tree.api")
	local node = api.tree.get_node_under_cursor()
	local filepath = node.absolute_path
	local filename = vim.fn.fnamemodify(filepath, "%:t")
	local modify = vim.fn.fnamemodify

	local results = {
		filepath,
		modify(filepath, ":."),
		modify(filepath, ":~"),
		filename,
		modify(filename, ":r"),
		modify(filename, ":e"),
	}

	local messages = {
		"Choose to copy to clipboard:",
		"1. Absolute path: " .. results[1],
		"2. Path relative to CWD: " .. results[2],
		"3. Path relative to HOME: " .. results[3],
		"4. Filename: " .. results[4],
		"5. Filename without extension: " .. results[5],
		"6. Extension of the filename: " .. results[6],
	}
	vim.api.nvim_echo({ { table.concat(messages, "\n"), "Normal" } }, true, {})
	local i = vim.fn.getchar()

	if i >= 49 and i <= 54 then
		local result = results[i - 48]
		print(result)
		vim.fn.setreg("*", result)
	else
		print("Invalid choice: " .. string.char(i))
	end
end

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	-- vim.keymap.set('n', '.', api.tree.change_root_to_parent, opts('Set Root'))
	-- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	-- vim.keymap.set("n", "<c-t>", api.tree.toggle, opts("toggle nvim-tree")) -- <c-*t*> for toggle
	-- vim.keymap.set("n", "<c-s>", function()api.tree.open({find_file=true}) end, opts("nvim-tree: current-file"))
	vim.keymap.set("n", "<c-y>", yankOptions, opts("toggle nvim-tree"))
	vim.keymap.set("n", "<c-x>", api.node.run.system, opts("execute file under cursor"))
end

-- pass to setup along with your other options
local tree = require("nvim-tree")
tree.setup({
	---
	on_attach = my_on_attach,
	---
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})
