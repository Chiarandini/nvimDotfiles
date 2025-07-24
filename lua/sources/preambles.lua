-- Custom nvim-cmp source for quickly creating the type of preamble you want

local Preamble = {}

local registered = false

Preamble.setup = function()
	if registered then
		return
	end
	registered = true

	local has_cmp, cmp = pcall(require, "cmp")

	if not has_cmp then
		return
	end

	local source = {}

	---Return the keyword pattern for triggering completion.
	---@return string
	function source:get_keyword_pattern()
		return [[\k]]
	end

	---Return trigger characters for triggering completion (optional).
	function source:get_trigger_characters()
		return { "@" }
	end

	local preamble_folder = os.getenv("HOME") .. "/.config/nvim/preamble/"

	local function get_files_in_directory(directory)
		local files = {}
		local ok, pfile = pcall(io.popen, 'ls -p "' .. directory .. '" | grep -v /')
		if not ok then
			return {}
		end
		if pfile == nil then
			return
		end
		for file in pfile:lines() do
			if file ~= nil and file:match(".tex") == ".tex" then
				table.insert(files, file:replace(".tex", ""))
			end
		end

		pfile:close()

		return files
	end

	local words = get_files_in_directory(preamble_folder)

	local function in_preamble() -- generic environment detection
		local is_inside = vim.fn["vimtex#env#is_inside"]("document")
		return not (is_inside[1] > 0 and is_inside[2] > 0)
	end

	---Invoke completion (required).
	---@param params cmp.SourceCompletionApiParams
	---@param callback fun(response: lsp.CompletionResponse|nil)
	function source:complete(params, callback)
		local input = string.sub(params.context.cursor_before_line, params.offset - 1)
		local prefix = string.sub(params.context.cursor_before_line, 1, params.offset - 1)
		local items = {}
		if vim.startswith(input, "@") and (prefix == "@") and in_preamble() then
			for _, word in pairs(words) do
				table.insert(items, {
					filterText = word,
					label = word,
					kind = cmp.lsp.CompletionItemKind.Snippet,
					documentation = {
						detail = "documentation, detail here",
						description = "documentation, description here",
					},
					detail = "details here",
					labelDetails = { detail = "labelDetails, detail", description = "labelDetails, description" },
					textEdit = {
						newText = word,
						range = {
							start = {
								line = params.context.cursor.row - 1,
								character = params.context.cursor.col - 1 - #input,
							},
							["end"] = {
								line = params.context.cursor.row - 1,
								character = params.context.cursor.col - 1,
							},
						},
					},
				})
			end
		end
		callback(items)
	end

	require("cmp").register_source("Preamble", source)
end

return Preamble
