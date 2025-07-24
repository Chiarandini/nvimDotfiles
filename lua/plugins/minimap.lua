---@module "neominimap.config.meta"
return {
    "Isrothy/neominimap.nvim",
    -- lazy = false,
    -- Optional
    keys = {
        { "<c-w>m", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
        { "<leader>mo", "<cmd>Neominimap on<cr>", desc = "Enable minimap" },
        { "<leader>mc", "<cmd>Neominimap off<cr>", desc = "Disable minimap" },
        { "<leader>mf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
        { "<leader>mu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
        { "<leader>ms", "<cmd>Neominimap toggleFocus<cr>", desc = "Toggle focus on minimap" },
        { "<leader>mwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
        { "<leader>mwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
        { "<leader>mwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
        { "<leader>mwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },
        { "<leader>mbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
        { "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
        { "<leader>mbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
        { "<leader>mbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },
    },
    init = function()
        vim.g.neominimap = {
            auto_enable = true,
        }
    end,
	config = function()
		require('configs.neominimap')
	end
}
