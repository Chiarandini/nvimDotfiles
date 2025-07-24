-- for translation, do :pan<tab> or :Pantran
return{'potamides/pantran.nvim',

cmd = 'Pantran',
keys = {{ '<c-w><m-t>', '<cmd>Pantran<cr>', desc = 'Transalte' }},

-- keys = {
-- 	{'<leader>T', require('pantran').motion_translate, mode = 'x', desc = 'Translated Selected'},
-- 	-- {'<leader>T', function()
-- 	-- local pantran = require("pantran")
-- 	-- local opts = {noremap = true, silent = true, expr = true}
-- 	-- vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
-- 	-- end, mode = 'x', desc = 'translate selected'},
-- },

config = function(_, opts)
	require('configs.pantran')
end

}
