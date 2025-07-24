-- views: popup, split, notify, virtualtext, mini, notify_send
local icons = require('utils.icons')
local opts = {
--  ╔══════════════════════════════════════════════════════════╗
--  ║       configure views for particular mesage types        ║
--  ╚══════════════════════════════════════════════════════════╝
	messages = { -- see noice.nvim-noice-(nice,-noise,-notice)-views
		enabled = true, -- enables the Noice messages UI
		view = "mini", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = false, -- view for search count messages. Set to `false` to disable (was virtualtext)
	},
	cmdline = {
		format = {
			search_down = {
				icon = icons.loup .. " ",
				view = "cmdline",
			},
			search_up = {
				icon = icons.loup .. " ",
				view = "cmdline",
			},
		},
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	popupmenu = {
		enabled = true, -- enables the Noice popupmenu UI
		---@type 'nui'|'cmp'
		backend = "cmp", -- backend to use to show regular cmdline completions
		-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
		-- kind_icons = {}, -- set to `false` to disable icons
	},
--  ┌                                                          ┐
--  │                 pre-configured defaults                  │
--  └                                                          ┘
	presets = {
		long_message_to_split = true,
		lsp_doc_border = true,
	},
	-- format = {
	-- 	level = {
	-- 		icons = {
	-- 			error = icons.error,
	-- 			info = icons.info,
	-- 			warn = icons.warning,
	-- 		}
	-- 	}
	-- }
--  ╔══════════════════════════════════════════════════════════╗
--  ║                       modify views                       ║
--  ╚══════════════════════════════════════════════════════════╝
	views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
		backend = 'cmp',
      },
	  mini = { -- secret timeout option
		  -- timeout = 10000
	  }
    },
--  ╔══════════════════════════════════════════════════════════╗
--  ║                     specific routing                     ║
--  ╚══════════════════════════════════════════════════════════╝
	routes = { -- re-route or skip certain outputs
		{
			filter = { event = "msg_showmode" },
			view = "mini",
		},
		{
			filter = {
				event = "lsp",
				find = "file", -- skip all lsp progress containing the word file
				-- find = "file://", -- skip all lsp progress containing the word workspace
			},
			opts = { skip = true },
		},
		-- { -- ISSUE: not currently filtering out, just want the @RECORDING text, not the -- INSERT -- text or -- VISUALINE -- text
		-- 	filter = {
		-- 		event = "msg_showmode",
		-- 		find = "INSERT",
		-- 	},
		-- 	opts = { skip = true },
		-- },
	},
}

require("noice").setup(opts)
