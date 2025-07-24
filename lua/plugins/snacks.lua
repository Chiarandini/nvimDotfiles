---@module "snacks"

--- Returns file search in git scope
---@param opts table
local find_files_project_dir = function(opts)
	local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	local gitRootFolder = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t")
	opts = opts or {}
	opts.cwd = gitPath
	require("snacks").picker.files(opts)
end

--- First find the directory you want in Documents, then open explorer in that directoy
local function fuzzy_snacks_explorer()
	local home = vim.fn.expand("~")
	local search_dir = home .. "//Documents/"

	local find_command = {
		"fd",
		"--type",
		"d",
		"--color",
		"never",
		".",
		search_dir,
	}

	vim.fn.jobstart(find_command, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data then
				local filtered = vim.tbl_filter(function(el)
					return el ~= ""
				end, data)

				local items = {}
				for _, v in ipairs(filtered) do
					-- Remove the common prefix from each path
					-- Escape special characters in the search_dir for gsub
					local escaped_search_dir = search_dir:gsub("([^%w])", "%%%1")
					-- Remove the common prefix from each path
					local relative_path = v:gsub("^" .. escaped_search_dir, "")

					-- local relative_path, _ = string.gsub(v, "^" .. vim.fn.escape(search_dir, "/"), "")
					-- print(relative_path)
					table.insert(items, { text = relative_path })
				end

				---@module 'snacks'
				Snacks.picker.pick({
					source = "directories",
					items = items,
					layout = { preset = "select" },
					format = "text",
					title = "Onedrive Documents", -- Set the title for the picker window
					confirm = function(picker, item)
						picker:close()
						local full_path = search_dir .. item.text
						-- vim.cmd("cd " .. full_path)
						require("snacks").picker.explorer({ cwd = full_path })
						-- vim.cmd('Oil ' .. vim.fn.fnameescape(full_path) .. " --float")
					end,
				})
			end
		end,
	})
end

--- First find the directory you want in Documents, then open explorer in that directoy
local function move_file_oil()
	--start by creating a new tab which will be where the file stuff will happen
	vim.cmd("tabe")
	local home = vim.fn.expand("~")
	local search_dir = home .. "//"

	local find_command = {
		"fd",
		"--type",
		"d",
		"--color",
		"never",
		".",
		search_dir,
	}

	vim.fn.jobstart(find_command, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data then
				local filtered = vim.tbl_filter(function(el)
					return el ~= ""
				end, data)

				local items = {}
				for _, v in ipairs(filtered) do
					-- Remove the common prefix from each path
					-- Escape special characters in the search_dir for gsub
					local escaped_search_dir = search_dir:gsub("([^%w])", "%%%1")
					-- Remove the common prefix from each path
					local relative_path = v:gsub("^" .. escaped_search_dir, "")

					-- local relative_path, _ = string.gsub(v, "^" .. vim.fn.escape(search_dir, "/"), "")
					-- print(relative_path)
					table.insert(items, { text = relative_path })
				end
				table.insert(items, { text = "Downloads" })

				local Oil = require("oil")
				---@module 'snacks'
				Snacks.picker.pick({
					source = "directories",
					items = items,
					layout = { preset = "select" },
					format = "text",
					title = "Onedrive+Downloads", -- Set the title for the picker window
					confirm = function(picker, item)
						picker:close()
						local first_path
						if item.text == "Downloads" then
							first_path = "~/Downloads/"
						else
							first_path = search_dir .. item.text
						end
						-- Open the selected directory in Oil
						Oil.open(first_path)

						-- Launch snacks.picker again in the selected directory
						vim.schedule(function()
							require("snacks").picker.pick({
							source = "directories",
							items = items,
							layout = { preset = "select" },
							format = "text",
							title = "Onedrive Documents", -- Set the title for the picker window
								confirm = function(inner_picker, inner_item)
									inner_picker:close()
									vim.cmd("vsplit")
									local second_path
									if inner_item.text == "Downloads" then
										second_path = "~/Downloads/"
									else
										second_path = search_dir .. inner_item.text
									end
									Oil.open(second_path)
									-- Open the selected file in a vertical split
									-- vim.cmd('vsplit ' .. vim.fn.fnameescape(
									--   full_path .. '/' .. inner_item.text
									-- ))
								end,
							})
						end)
					end,
				})
			end
		end,
	})
end

-- for i = 1, 10 do
--   vim.defer_fn(function()
--     vim.notify("Hello " .. i, "info", { id = "test" })
--   end, i * 500)
-- end
print = function(...)
	local print_safe_args = {}
	local _ = { ... }
	for i = 1, #_ do
		table.insert(print_safe_args, tostring(_[i]))
	end
	vim.notify(table.concat(print_safe_args, " "), "info")
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true, -- Replace netrw with the snacks explorer
		},
		gitbrowse = { enabled = true },
		-- image = {
		--   resolve = function(path, src)
		--     if require("obsidian.api").path_is_note(path) then
		--   	return require("obsidian.api").resolve_image_path(src)
		--     end
		--   end,
		-- },
		indent = { enabled = true },
		-- input = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
				  layout = { layout = { position = "right" } },
				}
			}
		},
		-- profiler = {enabeld = true },
		notifier = { enabled = true },
		notify = { enabled = true },
		quickfile = { enabled = true },
		animate = { enabled = true },
		scope = { enabled = true },
		scroll = {
			enabled = false, -- NOTE: it sometimes becomes jittery
			animate = {
				duration = { step = 15, total = 50 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 5, total = 25 },
				easing = "linear",
			},
			-- what buffers to animate
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},
		--NOTE: too much space, I would have to cutstomize it
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
	keys = {

		-- INFO: Currently using this to open terminal
		-- {
		-- 	"<c-w><c-t>",
		-- 	function()
		-- 		Snacks.explorer.open()
		-- 	end,
		-- 	desc = "open file explorer",
		-- },
		{
			"<c-w><c-e>",
			function()
				Snacks.explorer.open()
			end,
			desc = "open file explorer",
		},
		{
			"<c-w><c-p>",
			function()
				Snacks.picker()
			end,
			desc = "Open snacks picker",
		},
		{
			"<leader>pp",
			function()
				Snacks.toggle.profiler()
			end,
			desc = "toggle profiler",
		},
		{
			"<leader>ph",
			function()
				Snacks.toggle.profiler_highlights()
			end,
			desc = "toggle profiler highlights",
		},
		{
			"<c-w><c-b>",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<space><c-b>",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<space>cp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "[c]onfig [p]lugins",
		},
		-- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
		-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
		{
			"<space>fdd",
			function()
				Snacks.picker.files({ cwd = "~//Documents" })
			end,
			desc = "[d]ocuments (two d's for general search)",
		},

		{
			"<space>fo",
			function()
				Snacks.picker.recent()
			end,
			desc = "[f]ind [r]ecent",
		},
		{
			"<space>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "[f]ind [n]otifications",
		},
		{
			"<space>fp",
			function()
				find_files_project_dir({
					prompt_title = "project files",
					results_title = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t"),
				})
			end,
			desc = "[f]ind [p]roject files",
		},
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
		{
			"<space>ff",
			fuzzy_snacks_explorer,
			desc = "switch cur dir+explorer",
			-- function()
			-- 	Snacks.picker.zoxide(
			-- 	{
			-- 	  finder = "files",
			-- 	  format = "file",
			-- 	  show_empty = true,
			-- 	  hidden = false,
			-- 	  ignored = false,
			-- 	  follow = false,
			-- 	  supports_live = true,
			-- 	})
			-- end
		},
		{
			-- obsidian, math
			"<space>om",
			function()
				Snacks.picker.files({ cwd = "~//Documents/NateObsidianVault/MathVault/" })
			end,
			desc = "[O]bsidian [M]ath",
		},
		{
			-- obsidian, math
			"<space>oo",
			function()
				Snacks.picker.files({ cwd = "~//Documents/NateObsidianVault/" })
			end,
			desc = "[O]bsidian (everything)",
		},
		{
			"<space>m",
			move_file_oil,
			desc = "move file between two directories",
		},
	},
}
