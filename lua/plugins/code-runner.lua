-- for code running
return{ 'CRAG666/code_runner.nvim',
dependencies = {
	{ 'CRAG666/betterTerm.nvim' } -- preffered in-vim terminal
},
keys = {
	{'<leader>RR', '<cmd>RunCode<CR>', { noremap = true, silent = false, desc = 'run code' }},
	-- {'<F5>', '<cmd>RunCode<CR>', { noremap = true, silent = false, desc = 'run code' }},
},
config = function(opts)
	require('configs.code-runner')
end
}
