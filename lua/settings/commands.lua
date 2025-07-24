-- want messages to automatically redirect to Noice
-- ISSUE: can't do this, messages not capitalised
-- vim.api.nvim_create_user_command('message', 'Noice', {force = true})

-- ╔══════════════════╗
-- ║ Helper Functions ║
-- ╚══════════════════╝

local function switch_case()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local word = vim.fn.expand("<cword>")
	local word_start = vim.fn.matchstrpos(vim.fn.getline("."), "\\k*\\%" .. (col + 1) .. "c\\k*")[2]

	-- Detect camelCase
	if word:find("[a-z][A-Z]") then
		-- Convert camelCase to snake_case
		local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
		-- Detect snake_case
	elseif word:find("_[a-z]") then
		-- Convert snake_case to camelCase
		local camel_case_word = word:gsub("(_)([a-z])", function(_, l)
			return l:upper()
		end)
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
	else
		print("Not a snake_case or camelCase word")
	end
end


-- ╔══════════════════════╗
-- ║ unsaved-buffer check ║
-- ╚══════════════════════╝

-- Function to show all modified (unsaved) buffers in the quickfix list
local function show_modified_buffers()
	local buffers = vim.api.nvim_list_bufs()
	local modified_buffers = {}

	-- Collect all modified buffers
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "modified") then
			local name = vim.api.nvim_buf_get_name(buf)
			if name == "" then
				name = "[No Name]"
			end
			table.insert(modified_buffers, {
				bufnr = buf,
				filename = name,
				lnum = 1,
				col = 0,
				text = name,
			})
		end
	end

	-- Populate the quickfix list with the modified buffers
	if #modified_buffers > 0 then
		vim.fn.setqflist({}, " ", {
			title = "Modified Buffers",
			items = modified_buffers,
		})
		vim.cmd("copen") -- Open the quickfix window
		print(#modified_buffers .. " modified buffers listed in the quickfix list.")
	else
		print("No modified buffers.")
	end
end

-- ╔══════════╗
-- ║ DiffOrig ║
-- ╚══════════╝

vim.api.nvim_create_user_command("DiffOrig", function()
	vim.cmd("vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis")
end, {})

-- ╔════════════════════════════════╗
-- ║ keymappings for some functions ║
-- ╚════════════════════════════════╝

require('utils.web_browsing_tools')
require('utils.terminal_utils')

vim.keymap.set("n", "<leader>s", switch_case, { desc = "CamelCase/snake_case" })

-- vim.keymap.set('n', 'ZA', check_unsaved_buffers, {desc = "Check unsaved buffers before quitting all"})

-- Map this function to a key combination
vim.keymap.set("n", "<c-w>u", show_modified_buffers, { noremap = true, silent = true, desc = "open unsaved quickfix" })
