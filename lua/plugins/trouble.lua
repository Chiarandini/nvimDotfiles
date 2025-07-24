-- nice quickix window
return { "folke/trouble.nvim",
dependencies =  'nvim-tree/nvim-web-devicons', -- nice icons for nvim-tree
cmd = {'Trouble', 'TroubleToggle'},
keys = {
		{'<space>q', function() require('trouble').toggle() end, desc = ' [q]uick fix (toggles Trouble)' }
	}
}
