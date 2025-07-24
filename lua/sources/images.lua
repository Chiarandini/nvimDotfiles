-- Custom nvim-cmp source for inserting images in latex files

local Images = {}

local registered = false

Images.setup = function()
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
		return { "." }
	end

	--- get the file in a directy in table format
	---@param directory string the directory in question
	---@return table table return the table
	local function get_files_in_directory(directory)
		local files = {}
		local ok, pfile = pcall(io.popen, 'ls -p "' .. directory .. '" | grep -v /')
		if not ok then
			return {}
		end
		for file in pfile:lines() do
			table.insert(files, file)
		end

		pfile:close()

		return files
	end

	--- Surround the image_name passed in with a figure envrionment
	---@param image_name string the name of the file in the ../images/ directory
	---@return string figure_environment representation of the figure environment
	local function getLatexFigureEnvironment(image_name)
		return [[
\begin{figure}[H]
  \centering
  \includegraphics[width=7cm]{../images/]] .. image_name .. [[}
  % \caption{}
  \label{fig:]] .. image_name .. [[}
\end{figure}
]]
	end

	---Invoke completion (required).
	---@param params cmp.SourceCompletionApiParams
	---@param callback fun(response: lsp.CompletionResponse|nil)
	function source:complete(params, callback)
		local input = string.sub(params.context.cursor_before_line, params.offset - 1)
		local prefix = string.sub(params.context.cursor_before_line, 1, params.offset - 1)
		local image_files = {}
		if vim.startswith(input, ".") and (prefix == ".") then
			local images = get_files_in_directory("./../images")
			for _, image in ipairs(images) do
				table.insert(image_files, {
					filterText = image,
					label = image,
					-- kind = cmp.lsp.CompletionItemKind.Reference,
					kind = cmp.lsp.CompletionItemKind.File,
					textEdit = {
						newText = getLatexFigureEnvironment(image:replace(".png", "")),
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
		callback(image_files)
	end


	require("cmp").register_source("Images", source)
end

return Images
