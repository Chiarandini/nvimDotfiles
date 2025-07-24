local addTagLine = function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()

	--NOTE: I want to eventually just fallback to <s-cr>
	if node:type() == "block_sequence" then
		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "", "  - " })
		vim.api.nvim_win_set_cursor(0, { row + 1, col })
	end
end

local Opts = function(desc)
	return  {silent = true, buffer = true, desc = desc}
end

vim.keymap.set("i", "<s-cr>", addTagLine, { buffer = true })
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', Opts('auto spell fix'))
