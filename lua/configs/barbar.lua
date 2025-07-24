local map = vim.keymap.set
local opts = { silent = true }

--- to shorten options
---@param desc string the description of the keymapping
local function Opts(desc)
	return { silent = true, desc = desc }
end

local function superClose()
	-- close current win if there are more than 1 win
	-- else close current tab if there are more than 1 tab
	-- else close current vim
	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
	vim.cmd([[BufferClose!]])
	elseif #vim.api.nvim_list_tabpages() > 1 then
	vim.cmd([[BufferClose!]])
	else
	vim.cmd([[qa]])
	end
end


vim.keymap.set('n', '<C-q>', superClose, { desc = 'Super <C-q>' })

-- Move to previous/next
map("n", "[b", "<Cmd>BufferPrevious<CR>", Opts("Previous Buffer"))
map("n", "]b", "<Cmd>BufferNext<CR>", Opts("Next Buffer"))

-- Re-order to previous/next
map("n", "[B", "<Cmd>BufferMovePrevious<CR>", Opts("Move Buffer Left"))
map("n", "]B", "<Cmd>BufferMoveNext<CR>", Opts("Move Buffer Right"))

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "¡", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "™", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "£", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "¢", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "∞", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "gP", "<Cmd>BufferPin<CR>", opts)

-- Close buffer (ZA and ZT are in keymaps.lua)
map("n", "ZZ", "<cmd>w<cr><Cmd>BufferClose<CR>", opts)
-- fore clsoe buffer
-- map("n", "ZQ", "<Cmd>BufferClose!<CR>", opts)
-- close buffer and split
map("n", "ZS", "<Cmd>BufferClose<CR><cmd>q<cr>", opts)
-- close all but pinned
map("n", "ZP", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

-- Sort automatically by...
map("n", "<leader>Bb", "<Cmd>BufferOrderByBufferNumber<CR>", Opts("sort by buffer number"))
map("n", "<leader>Bd", "<Cmd>BufferOrderByDirectory<CR>", Opts("sort by directory"))
map("n", "<leader>Bl", "<Cmd>BufferOrderByLanguage<CR>", Opts("sort by language"))
map("n", "<leader>Bw", "<Cmd>BufferOrderByWindowNumber<CR>", Opts("sort by window number"))

require("barbar").setup({
	exclude_ft = { "alpha" },
	preset = "powerline", -- default, powerline, slanted
	pinned = { button = "", filename = true },
	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	-- no_name_title = "empty",
	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		NvimTree = true,
		-- ISSUE: this creates millions of errors
		-- ["neo-tree"] = {event = 'BufWinLeave', text = 'Neo Tree'},
	},
})
