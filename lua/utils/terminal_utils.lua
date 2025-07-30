-- ╔══════════╗
-- ║ Terminal ║
-- ╚══════════╝
--
-- Variable to keep track of terminal buffer
local term_buf = nil

-- Function to toggle the terminal
function _G.toggle_term()
	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		-- Check if terminal buffer is visible in any window
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == term_buf then
				-- If visible, close the terminal window
				vim.cmd("hide")
				return
			end
		end
	else
		-- If term_buf is invalid, set it to nil
		term_buf = nil
	end

	if term_buf == nil then
		-- If no terminal buffer exists, create a new one
		vim.cmd("botright 15split | terminal")
		term_buf = vim.api.nvim_get_current_buf()
	else
		-- If terminal buffer exists, show it again
		vim.cmd("botright 15split")
		vim.api.nvim_set_current_buf(term_buf)
	end

	-- Setting terminal mode
	vim.cmd("startinsert")
end

-- vim.keymap.set("n", "<c-w><c-t>", ":lua toggle_term()<CR>", { noremap = true, silent = true, desc = "toggle terminal" })
-- vim.keymap.set("t", "<c-w><c-t>", "<C-\\><C-n>:lua toggle_term()<CR>", { noremap = true, silent = true, desc = "toggle terminal" })
