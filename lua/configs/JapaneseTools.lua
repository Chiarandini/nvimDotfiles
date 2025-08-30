
local japanese_tools = require('JapaneseTools').setup()

vim.keymap.set('<leader>j', function()
	japanese_tools.toggle()
end, {desc = "switch to japanese mode"})
