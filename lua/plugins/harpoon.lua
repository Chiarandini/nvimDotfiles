--save files to switch between quickly
-- WARN: I'm looking for global marks rather than project specific marks

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
	-- event='VeryLazy',
	keys = {
		{'<c-1>', function() require('harpoon'):list():select(1) end, desc = "harpon 1"},
		{'<c-9>', function() require('harpoon'):list():select(2) end, desc = "harpon 2"},
		{'<c-0>', function() require('harpoon'):list():select(0) end, desc = "harpon 3"},
		{'<leader>hh', function()
		require('harpoon'):list():append()
		vim.notify('file added to harpoon', 2, {title = "Harpoon", icon = require('utils.icons').fish})
end
		, desc = "harpon 3"},
	},
	config = function()
		require('configs.harpoon')
	end
}

-- might do this


--  ╔══════════════════════════════════════════════════════════╗
--  ║                  better file navigation                  ║
--  ╚══════════════════════════════════════════════════════════╝


-- -- TODO: to switch quickly between wanted files (might use harpoon)
-- {
-- 	"cbochs/grapple.nvim",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- },
