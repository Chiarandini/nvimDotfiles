-- ╔════════════════════════════════════════════════════╗
-- ║ Most important files mapped for immediate access.  ║
-- ╚════════════════════════════════════════════════════╝
-- {{
vim.keymap.set("n", "<space>ev", "<cmd>e $MYVIMRC<cr>", { desc = "edit $MYVIMRC" })
vim.keymap.set("n", "<space>ey", "<cmd>e ~/.yabairc<cr>", { desc = "edit .yabairc" })
vim.keymap.set("n", "<space>ez", "<cmd>e ~/.zshrc<cr>", { desc = "edit .zshrc" })

-- I don't use this rn
-- vim.keymap.set("n", "<space>et", "<cmd>e ~/.config/tmux/tmux.conf<cr>", { desc = "edit tmux.conf" })
-- vim.keymap.set("n", "<space>es", "<cmd>e ~/.skhdrc<cr>", { desc = "edit .skhdrc" })

-- currently, there is no need to source bc of Lazy, but it may be important in the future; kept in case.
-- vim.keymap.set("n", "<leader>sv", "<cmd>so $MYVIMRC<cr>")

-- }}

-- ╔══════════════════════════════╗
-- ║ Important defaults remapped! ║
-- ╚══════════════════════════════╝
-- {{
-- I remap J/K to keep centered on the screen while scrolling.
vim.keymap.set("n", "J", "gj<c-e>")
vim.keymap.set("n", "K", "gk<c-y>")

vim.keymap.set("n", ";", ":", { desc = "you'd be surprised how powerful this is" })

-- I would love for this to be the case, but I think I shouldn't deviate too far from
-- defaults.
-- preffered undo key (make c-r "redo" the line, i.e. default U)
-- vim.keymap.set("n", "U", "<c-r>")
-- vim.keymap.set("n", "<c-r>", "<c-r><cmd>lua require('notify')('use U',3, {title = 'Replace <c-r> with U', timeout = '5000'})<cr>")
-- }}

-- ╔════════════════════╗
-- ║ backup colorscheme ║
-- ╚════════════════════╝
-- {{
vim.cmd.colorscheme("slate")
-- }}

-- ╔═══════════════════════════════╗
-- ║ Global programing information ║
-- ╚═══════════════════════════════╝
-- {{
-- I sometimes want to load plugins only on the files in which I may program (ex. lua,
-- python, etc.). This list is global so that it is consistent between plugins.
vim.g.programming_ft = {'typescriptreact', 'typescript', 'javascript', 'python', 'lua', 'css', 'html'}

-- I find defining this globally here makes sure that it is always defined,
-- even when lazy realoads. I am doing this here bc I cannot find a way to
-- toggle nvim-cmp itself, it seems I have to totally disable and enable it
-- like this.
vim.g.cmp_toggle = true


-- Global function: Plain replacement (all characters are non-magic)
function string:replace(substring, replacement, n)
	return (self:gsub(substring:gsub("%p", "%%%0"), replacement:gsub("%%", "%%%%"), n))
end


--NOTE: I can use lua= to print a table!!!

-- prints table
-- @param tbl table the table in question
-- function DUMP(tbl)
--     local cache, stack, output = {},{},{}
--     local depth = 1
--     local output_str = "{\n"
--
--     while true do
--         local size = 0
--         for _,_ in pairs(tbl) do
--             size = size + 1
--         end
--
--         local cur_index = 1
--         for k,v in pairs(tbl) do
--             if (cache[tbl] == nil) or (cur_index >= cache[tbl]) then
--
--                 if (string.find(output_str,"}",output_str:len())) then
--                     output_str = output_str .. ",\n"
--                 elseif not (string.find(output_str,"\n",output_str:len())) then
--                     output_str = output_str .. "\n"
--                 end
--
--                 -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
--                 table.insert(output,output_str)
--                 output_str = ""
--
--                 local key
--                 if (type(k) == "number" or type(k) == "boolean") then
--                     key = "["..tostring(k).."]"
--                 else
--                     key = "['"..tostring(k).."']"
--                 end
--
--                 if (type(v) == "number" or type(v) == "boolean") then
--                     output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
--                 elseif (type(v) == "table") then
--                     output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
--                     table.insert(stack,tbl)
--                     table.insert(stack,v)
--                     cache[tbl] = cur_index+1
--                     break
--                 else
--                     output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
--                 end
--
--                 if (cur_index == size) then
--                     output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
--                 else
--                     output_str = output_str .. ","
--                 end
--             else
--                 -- close the table
--                 if (cur_index == size) then
--                     output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
--                 end
--             end
--
--             cur_index = cur_index + 1
--         end
--
--         if (size == 0) then
--             output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
--         end
--
--         if (#stack > 0) then
--             tbl = stack[#stack]
--             stack[#stack] = nil
--             depth = cache[tbl] == nil and depth + 1 or depth - 1
--         else
--             break
--         end
--     end
--
--     -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
--     table.insert(output,output_str)
--     output_str = table.concat(output)
--     print(output_str)
-- end
--

-- redirect the output of a Vim or external command into a scratch buffer
vim.cmd([[
function! Redir(cmd)
  if a:cmd =~ '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
  else
    redir => output
    execute a:cmd
    redir END
  endif
  tabnew
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
  put! = a:cmd
  put = '----'
endfunction
command! -nargs=1 Redir silent call Redir(<f-args>)
]])

vim.keymap.set('c', '<c-o>', '<c-b>Redir <c-e>', {desc = 'Output (redirect) to buffer'} )

-- }}
-- vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
