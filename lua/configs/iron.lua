local view = require("iron.view")
local iron = require("iron.core")

iron.setup({
	config = {
		-- Whether a repl should be discarded or not
		scratch_repl = true,
		-- Your repl definitions come here
		repl_definition = {
			sh = {
				-- Can be a table or a function that
				-- returns a table (see below)
				command = { "zsh" },
			},
			python = {
				command = { "python3" }, -- or { "ipython", "--no-autoindent" }
				format = require("iron.fts.common").bracketed_paste_python,
			},
		},
		-- How the repl window will be displayed
		-- See below for more information
		repl_open_cmd = require('iron.view').bottom(15),

		-- THIS IS THE ONE I CHOSE FOR NOW
		-- `view.offset` allows you to control both the size of each dimension and
		-- the distance of them from the top-left corner of the screen
		-- repl_open_cmd = view.offset({
		-- 	width = 60,
		-- 	height = vim.fn.floor(vim.api.nvim_win_get_height(0) * 0.75),
		-- 	w_offset = 0,
		-- 	h_offset = "5%",
		-- }),
		-- Iron doesn't set keymaps by default anymore.
		-- You can set them here or manually add keymaps to the functions in iron.core
		-- If the highlight is on, you can change how it looks
		-- For the available options, check nvim_set_hl
		highlight = {
			italic = true,
		},
		ignore_blank_lines = true, -- ignore blank lines when sending visual select lines

		-- `view.center` takes either one or two arguments
		-- repl_open_cmd = view.center("30%", 20)

		-- If you supply only one, it will be used for both dimensions
		-- The function takes an argument to whether the orientation is vertical(true) or
		-- horizontal (false)
		-- repl_open_cmd = view.center(function(vertical)
		-- 	-- Useless function, but it will be called twice,
		-- 	-- once for each dimension (width, height)
		-- 	if vertical then
		-- 		return 50
		-- 	end
		-- 	return 20
		-- end)
		--
	},
	keymaps = {
		send_motion = "<localleader>sc",
		visual_send = "<localleader>sc",
		send_file = "<localleader>sf",
		send_line = "<localleader>sl",
		send_until_cursor = "<localleader>su",
		send_mark = "<localleader>sm",
		mark_motion = "<localleader>mc",
		mark_visual = "<localleader>mc",
		remove_mark = "<localleader>md",
		cr = "<localleader>s<cr>",
		interrupt = "<localleader>s<space>",
		exit = "<localleader>sq",
		clear = "<localleader>cl",
	},

	-- Some helper functions allow you to calculate the offset
	-- in relation to the size of the window.
	-- While all other sizing functions take only the orientation boolean (vertical or not),
	-- for offsets, the functions will also take the repl size in that dimension
	-- as argument. The helper functions then return a function that takes two arguments
	-- to calculate the offset
	-- repl_open_cmd = view.offset {
	-- 	width = 60,
	-- 	height = vim.o.height * 0.75
	-- 	-- `view.helpers.flip` will subtract the size of the REPL
	-- 	-- window from the total dimension, then apply an offset.
	-- 	-- Effectively, it flips the top/left to bottom/right orientation
	-- 	w_offset = view.helpers.flip(2),
	-- 	-- `view.helpers.proportion` allows you to apply a relative
	-- 	-- offset considering the REPL window size.
	-- 	-- for example, 0.5 will centralize the REPL in that dimension,
	-- 	-- 0 will pin it to the top/left and 1 will pin it to the bottom/right.
	-- 	h_offset = view.helpers.proportion(0.5)
	-- }

	-- Differently from `view.center`, all arguments are required
	-- and no defaults will be applied if something is missing.
	-- repl_open_cmd = view.offset {
	-- 	width = 60,
	-- 	height = vim.o.height * 0.75
	-- 	-- Since we know we're using this function in the width offset
	-- 	-- calculation, we can ignore the argument
	-- 	w_offset = function(_, repl_size)
	-- 		-- Ideally this function calculates a value based on something..
	-- 		return 42
	-- 	end,
	-- 	h_offset = view.helpers.flip(2)
})
