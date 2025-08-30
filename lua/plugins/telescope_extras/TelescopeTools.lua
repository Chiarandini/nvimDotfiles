return {
	{
		"TelescopeTools.nvim",
		event = "VeryLazy",
		dev = true,
		config = function()
			require('TelescopeTools').check_system_readiness()
		end
	}
}
