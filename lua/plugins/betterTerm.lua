return
{
-- WARN: still very buggy. Here bc pretty and would love it to eventually be my default.
	{
    "nvzone/floaterm",
    cmd = "FloatermToggle",
    dependencies = "nvzone/volt",
	opts = {},
	-- config = function()
	-- 	require('floaterm').setup()
	-- end
},
{
	'CRAG666/betterTerm.nvim',
	event = 'TermOpen',
keys = {
	-- toggle firts term
	{
		'<c-w><c-t>',
		function() require('betterTerm').open() end,  -- vim.cmd([[doautocmd TermOpen]])
		mode = {'n', 't'},
		desc = "Open terminal",
	},
	{
		"<localleader>t",
		function() require('betterTerm').select() end,
		mode = {'n', 't'},
		{ desc = "Select terminal"},
	},
},
config = function()
	require('betterTerm').setup()
end
}
}



-- local betterTerm = require('betterTerm')
-- vim.keymap.set({"n", "t"}, "<C-;>", betterTerm.open, { desc = "Open terminal"})
-- -- Select term focus
-- vim.keymap.set({"n"}, "<c-t>t", betterTerm.select, { desc = "Select terminal"})
-- -- Create new term
-- local current = 2
-- vim.keymap.set( {"n"}, "<c-t>n", function() betterTerm.open(current) current = current + 1 end, { desc = "New terminal"} )
