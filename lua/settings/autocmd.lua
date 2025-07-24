-- local autocmd = vim.api.nvim_create_autocmd
-- local augroup = vim.api.nvim_create_augroup('init_cmds', {clear = true})
-- local augroup = vim.api.nvim_create_augroup('test', {clear = true})

-- autocmd('TextYankPost', {
--   desc = 'highlight text after is copied',
--   group = augroup,
--   callback = function()
--     vim.highlight.on_yank({higroup = 'Visual', timeout = 80})
--   end
-- })

-- autocmd('InsertChange', {
-- 	desc = 'testing cmp.visible()',
-- 	group = augroup,
-- 	callback = function()
-- 		-- vim.cmd([[lua =require('cmp').visible()<cr>]])
-- 		vim.cmd([[echom 'hello world']])
-- 	end
-- })

-- so that autoread refreshes buffer with these events
-- vim.cmd([[au FocusGained,BufEnter,FileChangedShell,CursorMoved * :checktime])

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "FileChangedShell", "CursorMoved" }, {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})

-- vim.cmd([[au FocusGained,BufEnter,CursorMoved, * :checktime]])

local autogroup_ft = vim.api.nvim_create_augroup("myfiletype", { clear = true })

-- vim.api.nvim_create_autocmd("InsertLeavePre", {
--     -- pattern = {"*"},
--     group = autogroup_ft,
--     callback = function()
-- 		vim.cmd('w')
--     end,
--    }
-- )

vim.api.nvim_create_autocmd("FileType", {
    pattern = {'markdown', 'txt', 'tex'},
    command= "setlocal spell",
    -- callback = function()
    --     vim.api.nvim_win_set_option(0, "spell", true)
    -- end,
    group = autogroup_ft
  }
)

-- close quickfix menu after selecting choice
-- NOTE: this is the responsibility of ftplugin/qf.lua
-- vim.api.nvim_create_autocmd(
--   "FileType", {
--   pattern={"qf"},
--   command=[[
--     nnoremap <buffer> <CR> <CR>:cclose<CR>
-- 	nnoremap <buffer> <S-CR> <CR>
--   ]]})
--


 vim.api.nvim_create_augroup('heirlineComponentUpdate', {clear = true})

vim.api.nvim_create_autocmd("User", {
    group = "heirlineComponentUpdate",
	pattern = "HeirlineGitToggle",
    callback = function()
		vim.g.heirline_git_show = not vim.g.heirline_git_show
    end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlinePdfSizeToggle",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_pdfsize_show = not vim.g.heirline_pdfsize_show
    end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlineDirectoryOn",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_directory_show = true
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlineDirectoryOff",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_directory_show = false
	end,
})

-- heirline_proj_relative_dir_show
vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlineRelativeDirOn",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_proj_relative_dir_show = true
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlineRelativeDirOff",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_proj_relative_dir_show = false
	end,
})


vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlineLspToggle",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_lsp_show = not vim.g.heirline_lsp_show
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlinePDFModeOn",
    group = "heirlineComponentUpdate",
    callback = function()
		vim.g.heirline_git_show = false
		vim.g.heirline_lsp_show = false
		vim.g.heirline_directory_show = false
		vim.g.heirline_pdfsize_show = true
    end,
})

--  ╔══════════════════════════════════════════════════════════╗
--  ║       open images, pdfs, and videos from neo-tree        ║
--  ╚══════════════════════════════════════════════════════════╝

local augroup = vim.api.nvim_create_augroup("user-autocmds", { clear = true })
local intercept_file_open = true

-- vim.api.nvim_create_user_command("InterceptToggle", function()
--   intercept_file_open = not intercept_file_open
--   local intercept_state = "`Enabled`"
--   if not intercept_file_open then
--     intercept_state = "`Disabled`"
--   end
--   vim.notify("Intercept file open set to " .. intercept_state, vim.log.levels.INFO,
--     {
--       title = "Intercept File Open",
--       ---@param win integer The window handle
--       on_open = function(win)
--         vim.api.nvim_buf_set_option(
--           vim.api.nvim_win_get_buf(win),
--           "filetype",
--           "markdown"
--         )
--       end
--     })
-- end, { desc = "Toggles intercepting BufNew to open files in custom programs" })

-- NOTE: Add "BufReadPre" to the autocmd events to also intercept files given on the command line, e.g.
-- `nvim myfile.txt`
-- WARN: Interfers with workspace symbols!
-- vim.api.nvim_create_autocmd({ "BufNew" }, {
--   group = augroup,
--   callback = function(args)
--     ---@type string
--     local path = args.match
--     ---@type integer
--     local bufnr = args.buf
--
--     ---@type string? The file extension if detected
--     local extension = vim.fn.fnamemodify(path, ":e")
--     ---@type string? The filename if detected
--     local filename = vim.fn.fnamemodify(path, ":t")
--
--     ---Open a given file path in a given program and remove the buffer for the file.
--     ---@param buf integer The buffer handle for the opening buffer
--     ---@param fpath string The file path given to the program
--     ---@param fname string The file name used in notifications
--     ---@param prog string The program to execute against the file path
--     local function open_in_prog(buf, fpath, fname, prog)
--       vim.notify(
--         string.format("Opening `%s` in `%s`", fname, prog),
--         vim.log.levels.INFO,
--         {
--           title = "Open File in External Program",
--           ---@param win integer The window handle
--           on_open = function(win)
--             vim.api.nvim_buf_set_option(
--               vim.api.nvim_win_get_buf(win),
--               "filetype",
--               "markdown"
--             )
--           end
--         }
--       )
--       -- vim.system({ prog, fpath }, { detach = true })
--       -- WARN: If you are not on nightly (<0.10), remove the line above and uncomment the line below
--       vim.fn.jobstart("prog " .. fpath, { detach = true })
--       vim.api.nvim_buf_delete(buf, { force = true })
--     end
--
--     local extension_callbacks = {
--       ["pdf"] = function(buf, fpath, fname)
--         -- open_in_prog(buf, fpath, fname, "zathura")
--         open_in_prog(buf, fpath, fname, "skim")
--       end,
--       ["png"] = function(buf, fpath, fname)
--         open_in_prog(buf, fpath, fname, "feh")
--       end,
--       ["jpg"] = "png",
--       ["mp4"] = function(buf, fpath, fname)
--         open_in_prog(buf, fpath, fname, "mpv")
--       end,
--       ["gif"] = "mp4",
--       ["mp3"] = function(buf, fpath, fname)
--         open_in_prog(buf, fpath, fname, "vlc")
--       end,
--     }
--
--     ---Get the extension callback for a given extension. Will do a recursive lookup if an extension callback is actually
--     ---of type string to get the correct extension
--     ---@param ext string A file extension. Example: `png`.
--     ---@return fun(bufnr: integer, path: string, filename: string?) extension_callback The extension callback to invoke, expects a buffer handle, file path, and filename.
--     local function extension_lookup(ext)
--       local callback = extension_callbacks[ext]
--       if type(callback) == "string" then
--         callback = extension_lookup(callback)
--       end
--       return callback
--     end
--
--     if extension ~= nil and not extension:match("^%s*$") and intercept_file_open then
--       local callback = extension_lookup(extension)
--       if type(callback) == "function" then
--         callback(bufnr, path, filename)
--       end
--     end
--   end
-- })

--  ╔══════════════════════════════════════════════════════════╗
--  ║       Insure tree-sitter is installed on filetype        ║
--  ╚══════════════════════════════════════════════════════════╝
--- returns a single input char
-- local function get_char_input()
-- 	return vim.fn.nr2char(vim.fn.getchar())
-- end
--
-- --- clears the command prompt
-- local function clear_prompt()
-- 	vim.api.nvim_command("normal! :")
-- end
--
-- local ask_install = {}
--
-- function EnsureTSParserInstalled()
-- 	local parsers = require("nvim-treesitter.parsers")
-- 	local lang = parsers.get_buf_lang()
--
-- 	if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) and ask_install[lang] ~= false then
-- 		vim.schedule_wrap(function()
-- 			local is_confirmed = false
-- 			-- TODO: implement a Y/n prompt util func
-- 			print("Install treesitter parser for " .. lang .. " ? Y/n")
-- 			local res = get_char_input()
-- 			if res:match("\r") then
-- 				is_confirmed = true
-- 			end
-- 			if res:match("y") then
-- 				is_confirmed = true
-- 			end
-- 			if res:match("Y") then
-- 				is_confirmed = true
-- 			end
-- 			clear_prompt()
--
-- 			if is_confirmed then
-- 				vim.cmd("TSInstall " .. lang)
-- 			else
-- 				ask_install[lang] = false
-- 			end
-- 		end)()
-- 	end
-- end
--
-- -- TODO: convert to auto group
-- vim.cmd([[au FileType * :lua EnsureTSParserInstalled()]])
