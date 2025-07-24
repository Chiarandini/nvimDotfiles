--=========================================
--
--  █████╗ ██╗     ██████╗ ██╗  ██╗ █████╗
-- ██╔══██╗██║     ██╔══██╗██║  ██║██╔══██╗
-- ███████║██║     ██████╔╝███████║███████║
-- ██╔══██║██║     ██╔═══╝ ██╔══██║██╔══██║
-- ██║  ██║███████╗██║     ██║  ██║██║  ██║
-- ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝
--=========================================




local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local icon = require('utils.icons')
local stats = require('lazy').stats()


local neovimLogo = {
"                                                               ",
"      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ",
"      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ",
"█████╗██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║█████╗ ",
"╚════╝██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝ ",
"      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║       ",
"      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝       ",
"                                                               ",
}

local chiarandini_light = {
" _____ _     _                           _ _       _ ",
"/  __ \\ |   (_)                         | (_)     (_)",
"| /  \\/ |__  _  __ _ _ __ __ _ _ __   __| |_ _ __  _ ",
"| |   | '_ \\| |/ _` | '__/ _` | '_ \\ / _` | | '_ \\| |",
"| \\__/\\ | | | | (_| | | | (_| | | | | (_| | | | | | |",
" \\____/_| |_|_|\\__,_|_|  \\__,_|_| |_|\\__,_|_|_| |_|_|"
}

local chiarandini_thick = {
".-------------------------------------------------------------------------------.",
"|                                                                               |",
"|  ██████╗██╗  ██╗██╗ █████╗ ██████╗  █████╗ ███╗   ██╗██████╗ ██╗███╗   ██╗██╗ |",
"| ██╔════╝██║  ██║██║██╔══██╗██╔══██╗██╔══██╗████╗  ██║██╔══██╗██║████╗  ██║██║ |",
"| ██║     ███████║██║███████║██████╔╝███████║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║ |",
"| ██║     ██╔══██║██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║ |",
"| ╚██████╗██║  ██║██║██║  ██║██║  ██║██║  ██║██║ ╚████║██████╔╝██║██║ ╚████║██║ |",
"|  ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚═╝ |",
"|                                                                               |",
"'-------------------------------------------------------------------------------'"
}


-- Set header
dashboard.section.header.val = neovimLogo

-- "    ██╗       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗       ██╗    ",
-- "    ██║       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║       ██║    ",
-- " ████████╗    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    ████████╗ ",
-- " ██╔═██╔═╝    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔═██╔═╝ ",
-- " ██████║      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ██████║   ",
-- " ╚═════╝      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝   ",

-- "                                                     ",
-- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
-- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
-- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
-- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
-- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
-- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
-- "                                                     ",

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		-- local now = os.date "%d-%m-%Y %H:%M:%S"
		local plugins = #vim.tbl_keys(require("lazy").plugins())
		local v = vim.version()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		local datetime = os.date " %d-%m-%Y   %H:%M:%S"
		dashboard.section.footer.val = string.format("󰂖 %d  %s %d.%d.%d  %s  󱐋 %s ms\n                    Chiarandini", plugins, icon.vim, v.major, v.minor, v.patch, datetime, ms)
		-- dashboard.section.footer.val = footer
		pcall(vim.cmd.AlphaRedraw)
	end,
})

-- if vim.g.did_very_lazy then
-- 	local stats = lazy_stats()
-- 	local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
-- 	stats_val = stats_val .. '  |  󰒲  ' .. stats.count .. ' plugins loaded in ' .. ms .. 'ms'
-- end
-- disable some rtp plugins
local footer = function()

	-- TODO: make it to show startup time!
    -- return string.format("󰂖 %d  %s %d.%d.%d  %s  %s %d ms", plugins, icon.vim, v.major, v.minor, v.patch, datetime, icon.clock, ms)
  end

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "i", icon.file .. "  New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "e", icon.folder .. "  Blank file" , ":ene<CR>"),
    dashboard.button( "f", icon.search_file .. "  Find file", ":cd ~//Documents/ | Telescope find_files<CR>"),
    dashboard.button( "o", icon.reference .. "  Old Files"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "r", icon.refactor .. "  Restore Last Session" , function() require('persistence').load({last = true}) end),
    dashboard.button( "s", icon.setting .. "  Settings (i.e. $MYVIMRC)" , ":e $MYVIMRC | :cd %:p:h  | pwd<CR>"),
    dashboard.button( "h", icon.bulb .. "  Help" , ":e ~/.config/README.md| :cd %:p:h  | pwd<CR>"),
    dashboard.button( "q", icon.error .. "  Quit NVIM", ":qa<CR>"),
}
-- [<cmd>lua require("persistence").load()<cr>]], {})
-- dashboard.section.footer.val = footer

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])



--  ╔══════════════════════════════════════════════════════════╗
--  ║                    layout information                    ║
--  ╚══════════════════════════════════════════════════════════╝

--  ┌──────────────────────────────────────────────────────────┐
--  │                  /                                       │
--  │    header_padding                                        │
--  │                  \  ┌──────────────┐ ____                │
--  │                     │    header    │     \               │
--  │                  /  └──────────────┘      \              │
--  │ head_butt_padding                          \             │
--  │                  \                          occu_        │
--  │                  ┌────────────────────┐     height       │
--  │                  │       button       │    /             │
--  │                  │       button       │   /              │
--  │                  │       button       │  /               │
--  │                  └────────────────────┘‾‾                │
--  │                  /                                       │
--  │ foot_butt_padding                                        │
--  │                  \  ┌──────────────┐                     │
--  │                     │    footer    │                     │
--  │                     └──────────────┘                     │
--  │                                                          │
--  └──────────────────────────────────────────────────────────┘
