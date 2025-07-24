local function peekOrHover()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if winid then
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local keys = {'a', 'i', 'o', 'A', 'I', 'O', 'gd', 'gr'}
		for _, k in ipairs(keys) do
            -- Add a prefix key to fire `trace` action,
            -- if Neovim is 0.8.0 before, remap yourself
            vim.keymap.set('n', k, '<CR>' .. k, {noremap = false, buffer = bufnr})
        end
    else
        vim.lsp.buf.hover()
    end
end


--optimize folding
return {
	{
		"kevinhwang91/nvim-ufo",
			-- NOTE: unhandledPromiseError
		keys = {
			{'zr', function() require('ufo').openFoldsExceptKinds() end},
			{'zm', function() require('ufo').closeFoldsWith() end},
			{'zR', function() require('ufo').openAllFolds() end},
			{'zM', function() require('ufo').closeAllFolds() end},
			{'L', peekOrHover},
		},
		dependencies = "kevinhwang91/promise-async",
		event = "BufReadPost",
		config = function()
			require("configs.ufo")
		end,
	},
}
