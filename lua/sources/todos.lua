-- Custom nvim-cmp source for Todo's

local Todos = {}

local registered = false

Todos.setup = function()
	if registered then
		return
	end
	registered = true

	local has_cmp, cmp = pcall(require, "cmp")

	if not has_cmp then
		return
	end


	--TODO: make this smarter
	-- local words = { "TODO", "HACK", "WARN", "PERF", "NOTE", "TEST" }
	local words = { "TODO", "HACK", "WARN", "WARNING", "PERF",'PERF', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE', 'NOTE', 'INFO', 'TEST', 'TESTING', 'PASSED', 'FAILED', 'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE'}
	-- local words = {
	-- 	hack = {'HACK'}, -- 
	-- 	warn = {'WARN', 'WARNING'}, -- 
	-- 	todo = {'TODO'}, -- 
	-- 	pref = {'PERF', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE'}, -- 
	-- 	note = {'NOTE', 'INFO'}, -- 
	-- 	test = {'TEST', 'TESTING', 'PASSED', 'FAILED'}, -- ⏲
	-- 	fix  = {'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE'}, -- 
	-- }


	local source = {}

	function source:new()
		return setmetatable({}, { __index = source })
	end

	function source:get_trigger_characters()
		return { "@" }
	end


	function source:get_keyword_pattern()
		-- Add dot to existing keyword characters (\k).
		return [[\%(\k\|\.\)\+]]
	end

	local function comment_language_specific(word)
		local filetype, _ = vim.filetype.match({buf = 0})
		if filetype == 'lua' then
			return '-- ' .. word .. ': '
		elseif filetype == 'vim' then
			return '" ' .. word .. ': '
		elseif filetype == 'tex' then
			return '% ' .. word .. ': '
		elseif filetype == 'typescriptreact' then
			return '// ' .. word .. ': '
		elseif filetype == 'python' then
			return '# ' .. word .. ': '
		end
	end


---@diagnostic disable-next-line: unused-local
	source.complete = function(self, request, callback)
		local input = string.sub(request.context.cursor_before_line, request.offset - 1)
		local prefix = string.sub(request.context.cursor_before_line, 1, request.offset - 1)

		if vim.startswith(input, "@") and (prefix == "@" or vim.endswith(prefix, " @")) then
			local items = {}
			for _, word in ipairs(words) do
				table.insert(items, {
					filterText = word,
					label = word,
					textEdit = {
						newText = comment_language_specific(word),
						range = {
							start = {
								line = request.context.cursor.row - 1,
								character = request.context.cursor.col - 1 - #input,
							},
							["end"] = {
								line = request.context.cursor.row - 1,
								character = request.context.cursor.col - 1,
							},
						},
					},
				})
			end
			callback({
				items = items,
				isIncomplete = true,
			})
		else
			callback({ isIncomplete = true })
		end
	end

	cmp.register_source("Todos", source)
end

return Todos
