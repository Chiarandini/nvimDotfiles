local function jumpWihDiagnostic()
	require("flash").jump({
		matcher = function(win)
			---@param diag Diagnostic
			return vim.tbl_map(function(diag)
				return {
					pos = { diag.lnum + 1, diag.col },
					end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
				}
			end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
		end,
		action = function(match, state)
			vim.api.nvim_win_call(match.win, function()
				vim.api.nvim_win_set_cursor(match.win, match.pos)
				vim.diagnostic.open_float()
			end)
			state:restore()
		end,
	})
end


return { -- enhanced /? and f,t,F,T
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
  -- stylua: ignore
  keys = {
	-- { "S", mode = { "n" }, jumpWihDiagnostic, desc = "Flash" },
	{ "S", mode = { "n" }, function() require('flash').jump() end, desc = "Flash" },
	-- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	{ "<c-w>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
