-- In your init.lua or wherever you configure keymaps
local TelescopeTools = require('TelescopeTools')

-- Check if everything is set up correctly
TelescopeTools.check_system_readiness()


vim.keymap.set('n', '<space>fdb', function()
  TelescopeTools.telescope_open_execute('~/Documents/Books')
end, { desc = 'Browse books with PDF preview' })
