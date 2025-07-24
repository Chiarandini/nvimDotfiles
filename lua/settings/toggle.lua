---@diagnostic disable: missing-parameter
--- when running the keypress, it also prints the descritpionJ
---@param text string the descritipon to be printe
function TOGGLE_PRINT(text)
	vim.cmd("echom " .. '"' .. text .. '"')
end

function TOGGLE_PRINT_WRAPPER(text, func)
	vim.cmd("echom " .. '"' .. text .. '"')
	func()
end

--- quickly map togggles
---@param lhs  string lhs
---@param rhs  string rhs
---@param desc string description
---@param echo_message boolean should there be a message showing the result of the mapping
local function map(lhs, rhs, desc, echo_message)
	local descr = desc or ""
	if type(rhs) == "string" then
		if echo_message == true or echo_message == nil then
			vim.keymap.set("n", lhs, rhs .. '<cmd>lua TOGGLE_PRINT("' .. descr .. '")<cr>', { desc = descr })
		else
			vim.keymap.set("n", lhs, rhs, { desc = descr })
		end
	elseif type(rhs) == "function" then
		if echo_message == true or echo_message == nil then
			vim.keymap.set("n", lhs, function()
				TOGGLE_PRINT_WRAPPER(descr, rhs)
			end, { desc = descr })
		else
			vim.keymap.set("n", lhs, rhs, { desc = descr })
		end
	else
		error("rhs is no a function or string")
	end
end

local function toggle(lhs, enable, disable, desc)
	map("[" .. lhs, enable, "enabling: " .. desc)
	map("]" .. lhs, disable, "disabling: " .. desc)
end

-- TODO: Make a function to create these toggles. Mainly so that I can auotmate printing
-- "<option>" and "<nooption>" in the description and automatically notify it.

-- toggle inlayhints
toggle(
	"o<c-i>",
	function() vim.lsp.inlay_hint.enable() end,
	function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
	"inlay hints"
)

-- In case you forget, a way to check a setting without toggling it is to put an
-- exclamation mark, ex: setl autochdir?
toggle("oa", "<cmd>setl autochdir<cr>", "<cmd>setl noautochdir<cr>", "autochdir")
toggle("n", "<cmd>setl hlsearch<cr>", "<cmd>setl nohlsearch<cr>", "hlsearch")
toggle(
	"oN",
	"<cmd>nnoremap n nzz<cr><cmd>nnoremap N Nzz<cr>",
	"<cmd>nnoremap n n<cr><cmd>nnoremap N N<cr>",
	"centered n/N"
)

map("[t", "gT", "prev tab", false)
map("]t", "gt", "next tab", false)
map(">t", "<cmd>+tabmove<cr>", "move buf right", false)
map("<t", "<cmd>-tabmove<cr>", "move buf left", false)

-- if deep in <c-]> or gd, good way to go forward and back
map("[b", "<cmd>bp<cr>", "prev buffer", false)
map("]b", "<cmd>bn<cr>", "next buffer", false)

toggle(
	"o<c-t>",
	function() require("tint").enable() end,
	function() require("tint").disable() end,
	"tint"
)

local plugin = require("lazy.core.config").plugins["nvim-cmp"]
TOGGLE_CMP = function(bool)
	-- this is defined in ~/.config/nvim/lua/configs/cmp.lua
	vim.g.cmp_toggle = bool
	require("lazy.core.loader").reload(plugin)
end

map("[C", "<cmd>lua TOGGLE_CMP(true)<cr>", "enable nvim-cmp")
map("]C", "<cmd>lua TOGGLE_CMP(false)<cr>", "disable nvim-cmp")

-- for messages in statusline
-- map("[i","<cmd>let g:ToggleMsgInStatusline=1<cr><cmd>echo \"ToggleMsgInStatusline\"<cr>",'toggle lualine showing message')
-- map("]i","<cmd>let g:ToggleMsgInStatusline=0<cr><cmd>echo \"noToggleMsgInStatusline\"<cr>",'toggle lualine showing message')

-- for seeing pdf size (checking live compiling)
map(
	"[P",
	'<cmd>let g:TogglePdfSizeInStatusline=1<cr><cmd>echo "TogglePdfSizeInStatusline"<cr>',
	"toggle lualine pdf size message"
)
map(
	"]P",
	'<cmd>let g:TogglePdfSizeInStatusline=0<cr><cmd>echo "noTogglePdfSizeInStatusline"<cr>',
	"toggle lualine pdf size message"
)

--for quickfix list
map("[q", "<cmd>cprev<cr>", "quick fix previous")
map("]q", "<cmd>cnext<cr>", "quick fix next")
map("[Q", "<cmd>cfirst<cr>", "quick fix first")
map("]Q", "<cmd>clast<cr>", "quick fix last")

-- from unimpaired that I liked
map("[ob", "<cmd>set background=light<cr>", "light background")
map("]ob", "<cmd>set background=dark<cr>", "dark background")
map("[oc", "<cmd>setlocal cursorline<cr>", "cursoline")
map("]oc", "<cmd>setlocal nocursorline<cr>", "nocursorline")
map("[od", "<cmd>diffthis<cr>", "diffthis")
map("]od", "<cmd>diffoff<cr>", "diffoff")
map("[oh", "<cmd>set hlsearch<cr>", "hlsearch")
map("]oh", "<cmd>set hlsearch<cr>", "nohlsearch")
map("[oi", "<cmd>set ignorecase<cr>", "ignorecase")
map("]oi", "<cmd>set noignorecase<cr>", "noignorecase")
map("[ol", "<cmd>setlocal list<cr>", "see trailing characters")
map("]ol", "<cmd>setlocal nolist<cr>", "hide trailing characters")
map("[on", "<cmd>setlocal number<cr>", "number")
map("]on", "<cmd>setlocal nonumber<cr>", "nonumber")
map("[or", "<cmd>setlocal relativenumber<cr>", "relativenumber")
map("]or", "<cmd>setlocal norelativenumber<cr>", "norelativenumber")
map("[os", "<cmd>setlocal spell<cr>", "spell")
map("]os", "<cmd>setlocal nospell<cr>", "nospell")
map("[oS", "<cmd>setlocal scrollbind<cr>", "scrollbind")
map("]oS", "<cmd>setlocal noscrollbind<cr>", "noscrollbind")
map("[ot", "<cmd>set colorcolumn=+1<cr>", "colorcolumn")
map("]ot", "<cmd>set colorcolumn=<cr>", "nocolorcolumn")
map("[ou", "<cmd>setlocal cursorcolumn<cr>", "cursorcolumn")
map("]ou", "<cmd>setlocal nocursorcolumn<cr>", "nocursorcolumn")
map("[ov", "<cmd>set virtualedit+=all<cr>", "virtualedit")
map("]ov", "<cmd>set virtualedit-=all<cr>", "no virtualedit")
map("[ow", "<cmd>setlocal wrap<cr>", "wrap")
map("]ow", "<cmd>setlocal nowrap<cr>", "nowrap")
map("[ox", "<cmd>set cursorline cursorcolumn<cr>", "x on cursor")
map("]ox", "<cmd>set nocursorline nocursorcolumn<cr>", "no x on cursor")

-- lsp toggle
toggle("oL", "<cmd>LspStart<cr>", "<cmd>LspStop<cr>", "lsp")

-- toggle highlighting variable
map("[oI", "<cmd>IlluminateResumeBuf<cr>", "enable Illuminate")
map("]oI", "<cmd>IlluminatePauseBuf<cr>", "disable Illuminate")

-- to get [e ]e (swapping lines and [<space ]<space> (adding spaces)
require("settings.fugitive-toggles")

-- toggle making window bigger on buffer switchign
map("[oW", '<cmd>WindowsEnableAutowidth<cr><cmd>echo "animated"<cr>', "animated windows")
map("]oW", '<cmd>WindowsDisableAutowidth<cr><cmd>echo "static"<cr>', "static windows")

-- toggle seing text in more easily visualizable blocks
map("[oB", "<cmd>BlockOn<cr>", "Block On")
map("]oB", "<cmd>BlockOff<cr>", "Block Off")

-- toggle tressitter options
map("[oT", ":TSEnable ", "Tressitter Enable")
map("]oT", ":TSDisable ", "Tressitter Disable")

toggle('V',
':DapVirtualTextEnable<cr>',
':DapVirtualTextDisable<cr>',
'debug virtual text')
-- toggle spelling  (want ]s to only stop at bad words)
-- map("[s", "[S", 'spelling')
-- map("]s", "]S", 'nospelling')

-- tidy toggle
-- map('[oT', '<cmd>set colorcolumn=+1<cr>', 'colorcolumn')
