--  Hints:
--  Do <c-/> to see more options
--  ╒══════════════════════════════════════════════════════════╕
--  │                                                          │
--  │                     Telescope Setup                      │
--  │                                                          │
--  ╘══════════════════════════════════════════════════════════╛
-- useful link https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes

-- to search through a project dir using Lsp or git location
-- local relativeGitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]:replace(vim.fn.expand('~/'), '')

local function get_open_command()
  if vim.fn.has('macunix') then
    return 'open'
  elseif vim.fn.has('win32') then
    -- 'start' is the equivalent on Windows
    return 'start'
  else
    -- 'xdg-open' is the standard for most Linux desktops
    return 'xdg-open'
  end
end

-- Keymap to find and "execute" books
local function telescope_open_execute(path)
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local builtin = require('telescope.builtin')

  builtin.find_files({
    prompt_title = '📚 Open Book',
    cwd = path,

    -- This is the key part: we attach a custom mapping
    attach_mappings = function(prompt_bufnr, map)
      local function open_with_default_app()
        -- Get the full details of the currently selected entry
        local entry = require('telescope.actions.state').get_selected_entry()
        -- Close the Telescope window first
        actions.close(prompt_bufnr)

        -- Construct the full path and run the system command
        local path = entry.cwd .. '/' .. entry.value
        local open_cmd = get_open_command()

        -- Use jobstart for a non-blocking call
        vim.fn.jobstart({ open_cmd, path }, {
          -- Detach the process so Neovim doesn't wait for it
          detach = true,
        })
      end

      -- Map the <CR> (Enter) key in insert mode to our custom function
      map('i', '<CR>', open_with_default_app)
      -- Optional: Map it for normal mode as well
      map('n', '<CR>', open_with_default_app)

      return true
    end,
  })
end

--- Returns file search in git scope
---@param opts table
local find_files_project_dir = function(opts)
	local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	local gitRootFolder = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t")
	opts = opts or {}
	opts.cwd = gitPath
	require("telescope.builtin").find_files(opts)
end

-- to grep through a project dir using Lsp or git location
local grep_files_project_dir = function(opts)
	local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	local gitRootFolder = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t")
	opts = opts or {}
	opts.cwd = gitPath
	if vim.v.shell_error ~= 0 then
		-- if not git then active lsp client root
		-- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
		opts.cwd = vim.lsp.active_clients()[1].config.cmd_cwd
	end
	require("telescope.builtin").live_grep(opts)
end

local stackOptions = { -- layout information in config
	prompt_title = "call stack",
	sort_mru = true,
	ignore_current_buffer = true,
}


return {

	-- ISSUE: breaks :Telescope headings (original use: for faster file navigation)
	-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

	{
		"dhruvmanila/browser-bookmarks.nvim",
		lazy = true,
		version = false,
		-- cmd = 'BrowserBookmarks',
		dependencies = {
			--   -- Only if your selected browser is Firefox, Waterfox or buku
			--   'kkharji/sqlite.lua',
			--
			--   -- Only if you're using the Telescope extension
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("browser_bookmarks").setup()
		end,
	},
	{
		"TelescopeTools.nvim",
		event = "VeryLazy",
		dev = true,
		config = function()
			require('configs.TelescopeTools')
		end
	},

	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },               -- for better pop-up integration
			{ "debugloop/telescope-undo.nvim" },     -- see undo tree in telescope
			{ "nvim-telescope/telescope-media-files.nvim" }, -- see images in telescope
			{ "nvim-telescope/telescope-file-browser.nvim" }, -- for better file navigation
			{ "nvim-telescope/telescope-bibtex.nvim" }, -- to find bibliography
			{ "rcarriga/nvim-notify" },              -- for the notify source
			{ "folke/todo-comments.nvim" },          -- for todo source
			{ "crispgm/telescope-heading.nvim" },    -- to jump between headings in latex (and other filetypes)
			{ "nvim-telescope/telescope-dap.nvim" }, -- for debugging navigation
			{ "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
			{ "JoseConseco/telescope_sessions_picker.nvim" }, -- for picking sessions
			{ "folke/trouble.nvim" },                -- for picking diagnostics
			{
				'jmbuhr/telescope-zotero.nvim',
				dependencies = { { 'kkharji/sqlite.lua' } },
				config = function()
					require'zotero'.setup({})
				end
			},
			-- { "rachartier/tiny-code-action.nvim", config = function() require('tiny-code-action').setup() end },
		  },
		cmd = "Telescope",

		config = function()
			require("configs.telescope")
		end,

		--  ╒══════════════════════════════════════════════════════════╕
		--  │                    Setup Key Bindings                    │
		--  ╘══════════════════════════════════════════════════════════╛
		keys = {
			-- find current. PRIVILEGED: space space for efficienty of file switching and navigating
			{ "<space><space>", "<cmd>Telescope file_browser<cr>", desc = "Browse Current Dir" },
			-- call stack (TRYING RABBIT FOR NOW)
			-- {
			-- 	"<c-t>",
			-- 	function()
			-- 		require("telescope.builtin").buffers(stackOptions)
			-- 	end,
			-- 	desc = "file call-stack",
			-- },
			-- find [f]iles
			-- {
			-- 	"<space>ff",
			-- 	function()
			-- 		require("telescope.builtin").find_files()
			-- 	end,
			-- 	desc = "[f]ind [f]iles in cwd",
			-- },
			-- find [p]roject
			{
				"<space>fp",
				function()
					find_files_project_dir({
						prompt_title = "project files",
						results_title = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t"),
					})
				end,
				desc = "[f]ind [p]roject files",
			},
			-- find [m]arker
			{
				"<space>fm",
				function()
					require("telescope.builtin").marks()
				end,
				desc = "[f]ind [m]ark",
			},
			-- find [u]ndo
			{
				"<space>fu",
				function()
					require("telescope").extensions.undo.undo()
				end,
				desc = "[f]ind [u]ndo",
			},
			-- control f feature works just like in any other text editor
			{
				"<space>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown())
				end,
				desc = "Fuzzily search in current buffer",
			},
			-- NOTE: commented bc conficts with <c-f> for scrolling in lsp pum
			-- { '<c-f>', function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())end , { desc = 'Fuzzily search in current buffer' }},
			-- find [b]uffer
			{
				"<space>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "[f]ind [b]uffer",
			},
			-- find [o]ld
			-- {
			-- 	"<space>fo",
			-- 	function()
			-- 		require("telescope.builtin").oldfiles()
			-- 	end,
			-- 	desc = "[f]ind [o]ld files",
			-- },
			-- find [h]elp
			{
				"<space>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "[f]ind [h]elp tags",
			},
			-- find [c]ommands
			{
				"<space>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "[f]ind [c]ommands",
			},
			-- find [c]ommands
			{
				"<space>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "[f]ind [k]eymaps",
			},
			-- find [t]odo's
			{ "<space>ft",      "<cmd>TodoTelescope<cr>",          desc = "[f]ind [t]odo's" },
			-- find [n]otifications
			-- { "<space>fn",      "<cmd>Telescope notify<cr>",       desc = "[f]ind [n]otifications" },
			-- find [B]ookmarks
			{ "<space>fB",      "<cmd>Telescope bookmarks<cr>",    desc = "[f]ind [B]ookmarks" },
			{ "<space>fz",      "<cmd>Telescope zotero<cr>",    desc = "[f]ind [z]otero" },
			{
				"<space>fG",
				function()
					require("telescope.builtin").git_status({ cwd = ".", use_file_path = true })
				end,
				desc = "[f]ind [G]it changes",
			},

			--  ╔══════════════════════════════════════════════════════════╗
			--  ║                grepping special locations                ║
			--  ╚══════════════════════════════════════════════════════════╝

			-- find [g]rep all neovim config
			{
				"<space>gC",
				function()
					require("telescope.builtin").live_grep({
						search_dirs = { "~/.config/nvim/" },
						prompt_title = "grep all config",
					})
				end,
				desc = "[g]rep [c]onfiguration",
			},
			-- find [g]rep plugins -- gp currently being used for grep project
			-- {'<space>gp',function() require('telescope.builtin').live_grep({search_dirs = {'~/.config/nvim/lua/plugins/'}, prompt_title = 'grep plugins', results_title=vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ':t')}) end, desc = '[g]rep [p]lugins'},
			-- find [g]rep plugins
			{
				"<space>gc",
				function()
					require("telescope.builtin").live_grep({
						search_dirs = { "~/.config/nvim/lua/configs/" },
						prompt_title = "grep configs",
					})
				end,
				desc = "[g]rep [c]onfigs",
			},
			-- grep snippets
			{
				"<space>gs",
				function()
					require("telescope.builtin").live_grep({
						search_dirs = { "~/.config/nvim/LuaSnip/" },
						prompt_title = "grep snippets",
					})
				end,
				desc = "[g]rep [s]nippets",
			},
			-- grep current directory
			{
				"<space>gg",
				function()
					require("telescope.builtin").live_grep({ prompt_title = "grep cwd", results_title= vim.fn.fnamemodify(vim.fn.getcwd(), ":~")})
				end,
				desc = "grep current directory",
			},
			-- grep [p]roject
			{
				"<space>gp",
				function()
					grep_files_project_dir({
						prompt_title = "project grep",
						results_title = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t"),
					})
				end,
				desc = "[f]ind [p]roject files",
			},
			--  ╔══════════════════════════════════════════════════════════╗
			--  ║                     git navigations                      ║
			--  ╚══════════════════════════════════════════════════════════╝

			{
				"<space>fG",
				function()
					require("telescope.builtin").git_status({ cwd = ".", use_file_path = true })
				end,
				desc = "[f]ind [G]it changes",
			},

			{
				"<space>Gc",
				function()
					require("telescope.builtin").git_commits({})
				end,
				desc = "[g]it [c]ommits",
			},

			{
				"<space>Gf",
				function()
					require("telescope.builtin").git_files({})
				end,
				desc = "[g]it [f]iles",
			},

			{
				"<space>GS",
				function()
					require("telescope.builtin").git_stash({})
				end,
				desc = "[g]it [s]tash",
			},

			{
				"<space>Gs",
				function()
					require("telescope.builtin").git_status({})
				end,
				desc = "[g]it [s]tatus",
			},

			{
				"<space>Gb",
				function()
					require("telescope.builtin").git_bcommits({})
				end,
				desc = "[g]it [b]uffer diff preview",
			},
			--  ╔══════════════════════════════════════════════════════════╗
			--  ║                   special navigations                    ║
			--  ╚══════════════════════════════════════════════════════════╝

			-- [t]able of content
			{ "<space>t", "<cmd>Telescope heading<cr>", desc = "table of content" },
			-- control [v] history
			{ "<c-s-v>", "<cmd>Telescope neoclip theme=cursor<cr>", mode = "i", {} },
			--  find [t]odo's
			{ "<c-s-f>", "<cmd>Telescope command_history<cr>", mode = { "c" } },
			{ "<space>h", "<cmd>Telescope harpoon marks<cr>", desc = "harpoon" },

			--  ╔══════════════════════════════════════════════════════════╗
			--  ║                           LSP                            ║
			--  ╚══════════════════════════════════════════════════════════╝

			-- find [g]rep all neovim config
			{
				"<space>lr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "[l]sp [r]eferences",
			},
			{
				"<space>ld",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "[l]sp [d]efinitions",
			},
			{
				"<space>lo",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "[l]sp [o]utline",
			},
			{
				"<space>lp",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
				desc = "[l]sp [p]roject",
			},
			-- {'<space>lo',function() require('telescope.builtin').lsp_document_symbols() end, desc = '[l]sp [o]outline'},

			--  ╒══════════════════════════════════════════════════════════╕
			--  │                     file navigation                      │
			--  ╘══════════════════════════════════════════════════════════╛

			-- configure [p]lugins
			-- {
			-- 	"<space>cp",
			-- 	"<cmd>Telescope file_browser path=/Users/nathanaelchwojko-srawkey/.config/nvim/lua/plugins/<cr>",
			-- 	desc = "[c]onfig [p]lugins",
			-- },
			-- configure [P]reamble
			{
				"<space>cP",
				function()
					require("telescope.builtin").find_files({
						cwd = "/Users/nathanaelchwojko-srawkey/.config/nvim/preamble/",
					})
				end,
				desc = " config [P]reamble",
			},
			-- configure s[e]ttings
			{
				"<space>ce",
				"<cmd>Telescope file_browser path=/Users/nathanaelchwojko-srawkey/.config/nvim/lua/settings/<cr>",
				desc = "[c]onfig s[e]ttings",
			},
			-- configure all nvim (hence, [cc] for convenience)
			{
				"<space>cc",
				"<cmd>Telescope file_browser path=/Users/nathanaelchwojko-srawkey/.config/nvim/lua/configs/<cr>",
				desc = "config",
			},
			-- configure all (hence, [cC] for convenience)
			{
				"<space>cC",
				function()
					require("telescope.builtin").find_files({ cwd = "/Users/nathanaelchwojko-srawkey/.config/" })
				end,
				desc = "[c]onfig all",
			},
			-- configure [a]fter load filtype
			{
				"<space>cf",
				"<cmd>Telescope file_browser path=/Users/nathanaelchwojko-srawkey/.config/nvim/ftplugin<cr>",
				desc = "[c]onfig [f]tplugins",
			},
			-- configure [s]nippets
			{
				"<space>cs",
				"<cmd>Telescope file_browser path=/Users/nathanaelchwojko-srawkey/.config/nvim/LuaSnip/<cr>",
				desc = "[c]onfig [s]nippets",
			},

			-- document navigation
			-- document in [u]niversity (set current semester)
			{
				"<space>fdu",
				function()
					require("telescope.builtin").find_files({
						cwd =
						"/Users/nathanaelchwojko-srawkey/Documents/University/undergraduate/2022-2023/3rd semester/",
						prompt_title = "current-year university documents",
					})
				end,
				desc = "[d]ocuments [u]niversity (current semester)",
			},
			-- document in [u]niversity (set all)
			{
				"<space>fdU",
				function()
					require("telescope.builtin").find_files({
						cwd = "/Users/nathanaelchwojko-srawkey/Documents/University/",
						prompt_title = "all university documents",
					})
				end,
				desc = "[d]ocuments [U]niversity (serach globally)",
			},
			-- document
			-- {
			-- 	"<space>fdd",
			-- 	function()
			-- 		require("telescope.builtin").find_files({
			-- 			cwd = "/Users/nathanaelchwojko-srawkey/Documents/",
			-- 			prompt_title = "find document",
			-- 		})
			-- 	end,
			-- 	desc = "[d]ocuments (two dd's for general search)",
			-- },
			-- EYNTKA
			{
				"<space>fde",
				function()
					require("telescope.builtin").find_files({
						cwd = "/Users/nathanaelchwojko-srawkey/Documents/",
						search_file = "*EYNTKA*.tex",
						prompt_title = "find EYTNKA document",
					})
				end,
				desc = "[d]ocuments [e]YNTKA",
			},

			-- document in books
			-- { '<space>db', function() require('telescope.builtin').find_files({cwd = "/Users/nathanaelchwojko-srawkey/Documents/books/"}) end , desc = '[d]ocument [b]ooks'},

			-- document in books
			-- {
			-- 	"<space>fdb",
			-- 	function() telescope_open_execute('/Users/nathanaelchwojko-srawkey/Documents/books/') end,
			-- 	desc = "[d]ocument [b]ooks",
			-- },

			-- document with [e]YNTKA
			-- vim.keymap.set('n', '<space>de', function() builtin.find_files({cwd = "/Users/nathanaelchwojko-srawkey/Documents/University/", prefilter_sorter="EYNTKA"}) end , {})
			--  ╔═════════════════════════════════════════════════════════╗
			--  ║                                                         ║
			--  ║                       diagnostics                       ║
			--  ║                                                         ║
			--  ╚═════════════════════════════════════════════════════════╝

			-- for all diagnostics
			{
				"<space>dd",
				function()
					require("telescope.builtin").diagnostics({
						bufnr = 0,
					})
				end,
				desc = "[d]iagnostics (current file)",
			},
			{
				"<space>dp",
				function()
					require("telescope.builtin").diagnostics({
						root_dir = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ""),
					})
				end,
				desc = "[d]iagnostics [p]roject",
			},
			{
				"<space>de",
				function()
					require("telescope.builtin").diagnostics({ severity = vim.diagnostic.severity.ERROR })
				end,
				desc = "[d]iagnostics [e]rror",
			},
			{
				"<space>dw",
				function()
					require("telescope.builtin").diagnostics({ severity = vim.diagnostic.severity.WARN })
				end,
				desc = "[d]iagnostics [e]rror",
			},
			{
				"<space>di",
				function()
					require("telescope.builtin").diagnostics({ severity = vim.diagnostic.severity.INFO })
				end,
				desc = "[d]iagnostics [i]nfo",
			},
			{
				"<space>dh",
				function()
					require("telescope.builtin").diagnostics({ severity = vim.diagnostic.severity.HINT })
				end,
				desc = "[d]iagnostics [h]int",
			},
			--  ╔══════════════════════════════════════════════════════════╗
			--  ║                         debugging                        ║
			--  ╚══════════════════════════════════════════════════════════╝

			{
				"<space>Dc",
				function()
					require("telescope").extensions.dap.commands()
				end,
				desc = "[d]ebug [c]ommands",
			},
			{
				"<space>DC",
				function()
					require("telescope").extensions.dap.configurations()
				end,
				desc = "[d]ebug [C]onfiguration",
			},
			{
				"<space>Db",
				function()
					require("telescope").extensions.dap.list_breakpoints()
				end,
				desc = "[d]ebug [b]reakpoints",
			},
			{
				"<space>Dv",
				function()
					require("telescope").extensions.dap.variables()
				end,
				desc = "[d]ebug [v]ariables",
			},
			{
				"<space>Df",
				function()
					require("telescope").extensions.dap.frames()
				end,
				desc = "[d]ebug [f]rames",
			},

			--  ╔══════════════════════════════════════════════════════════╗
			--  ║                            --                            ║
			--  ║                      miscellaneous                       ║
			--  ║                            --                            ║
			--  ╚══════════════════════════════════════════════════════════╝

			{
				"<space>C",
				function()
					require("telescope.builtin").colorscheme()
				end,
				desc = "[C]olorscheme",
			},
			{
				"<space>r",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "[R]esume",
			},
			{ "<c-s-c>", "<cmd>Telescope bibtex theme=cursor<cr>", mode = "i", desc = "citation from bibtex" },
		},
	},
}
