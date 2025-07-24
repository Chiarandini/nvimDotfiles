vim.cmd([[
command! -buffer PDF exe "!open '" . expand("%:t:r") . ".pdf'"
" TSContextDisable -- disabled in setup (type "<space>cf context")
]])

local Opts = function(desc)
	return  {silent = true, buffer = true, desc = desc}
end

local shiftEnterOpt = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local whiteSpace = string.match(vim.api.nvim_get_current_line(), '^%s*')
	local is_inside


	is_inside = vim.fn["vimtex#env#is_inside"]('itemize')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		-- may need to remove a whitespace
		if string.match(vim.api.nvim_get_current_line(), '\\item') ~= nil then
			whiteSpace = whiteSpace:sub(2)
		end

		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '', whiteSpace .. '\\item ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('equivEnumerate') if (is_inside[1] > 0 and is_inside[2] > 0) then
		-- may need to remove a whitespace
		if string.match(vim.api.nvim_get_current_line(), '\\item[($\\Rw$)]') == nil then
			whiteSpace = whiteSpace:sub(2)
		end
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '' ,whiteSpace ..'\\item[($\\Rw$)] ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('enumerate')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		-- may need to remove a whitespace
		if string.match(vim.api.nvim_get_current_line(), '\\item') == nil then
			whiteSpace = whiteSpace:sub(2)
		end
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '' ,whiteSpace ..'\\item ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('Exercise')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '' ,whiteSpace ..'\\Question ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('Answer')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '' ,whiteSpace ..'\\Question ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('align')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '\\\\', whiteSpace ..'&= ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('cases')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '\\\\', whiteSpace})
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end

	is_inside = vim.fn["vimtex#env#is_inside"]('gather*')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '\\\\', whiteSpace})
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end
	is_inside = vim.fn["vimtex#env#is_inside"]('align*')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '\\\\', whiteSpace ..'&= ' })
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end
	is_inside = vim.fn["vimtex#env#is_inside"]('matrix')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '\\\\', whiteSpace})
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end
	is_inside = vim.fn["vimtex#env#is_inside"]('pmatrix')
	if (is_inside[1] > 0 and is_inside[2] > 0) then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '\\\\', whiteSpace})
		vim.api.nvim_win_set_cursor(0, {row +1, col})
		return
	end
	-- vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '','' })
end
vim.keymap.set('n', '<leader>eb', ':vs ../*.bib<cr>', Opts('[e]dit [b]ibliography'))
-- vim.keymap.set("i", "<c-j>", '<c-o>/<++><cr><esc>lv3lc', opt)
-- vim.keymap.set('n', '[c', '?\\chapter{<cr>', Opts('prev chapter'))
-- vim.keymap.set('n', ']c', '/\\chapter{<cr>', Opts('next chapter'))
vim.keymap.set('n', '<localleader>vw', '<Cmd>VimtexCountWords<CR>', Opts('[v]imtex [w]ord count'))
vim.keymap.set('i', '<s-cr>', shiftEnterOpt, Opts('insert item'))
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', Opts('auto spell fix'))

vim.keymap.set('n', ']D', '/begin{document}<cr>', Opts('Top of Document'))

vim.cmd([[vmap <buffer> ( S(lxh%hx%]])
vim.cmd([[vmap <buffer> [ S[lxh%hx%]])
vim.o.synmaxcol = 5000

-- some latex-specific shorthands
vim.cmd([[
Abolish -buffer bc because
]])

-- make textwidth bigger for tex files
vim.bo.textwidth = 110

-- these follow from this website: https://castel.dev/post/lecture-notes-2/
vim.keymap.set('i', '<c-s-f>', function()
	vim.cmd([[silent exec '.!inkscape-figures create "'.getline('.').'" "'.'./figures/"']])
	vim.cmd([[w]])
end, { buffer = true, desc = 'create tex figure' })

vim.keymap.set("n", "<c-s-f>", function()
	vim.cmd([[silent exec '!inkscape-figures edit "' . './figures/" > /dev/null 2>&1 &']])
	vim.cmd([[redraw!]])
end, {buffer = true, desc = 'edit tex figure'})

-- vim.keymap.del('i', ']]')


-- search with wrapped lines
-- function! SearchMultiLine(bang, ...)
--   if a:0 > 0
--     let sep = (a:bang) ? '\_W\+' : '\_s\+'
--     let @/ = join(a:000, sep)
--   endif
-- endfunction
-- command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>
