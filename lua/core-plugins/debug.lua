return {
	{ -- DAP client (Debug Adapter Protocol)
		"mfussenegger/nvim-dap",
		dependencies = {
			--  ┌                                                          ┐
			--  │                     dap enhancement                      │
			--  └                                                          ┘
			{
				"rcarriga/nvim-dap-ui",
				name = 'dapui',
				dependencies = { 'nvim-neotest/nvim-nio' },
				--configured in nvim-dap file
			},

			{ -- for virtual text
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup()
				end,
			},
			--  ┌                                                          ┐
			--  │                language-specific plugins                 │
			--  └                                                          ┘
			{-- for python
				'mfussenegger/nvim-dap-python',
				-- build=false,  -- HACK: here just until the lua5.1 warning disapears
			},
			{ -- for Neovim lua langauge
				"jbyuki/one-small-step-for-vimkind",
				keys = { { '<leader>dal', function() require("osv").launch({ port = 8086 }) end, desc = 'Lua', },
				},
			},
			 -- JS/TS debugging.
            {
                'mxsdev/nvim-dap-vscode-js',
                opts = {
                    debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
                    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                },
            },
            {
                'microsoft/vscode-js-debug',
                version = '1.x',
                build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
            },
		},
		--- stylua: ignore
		keys = {
		   {
		   '<F5>',
		   function()
			require("dap").continue()
			end,
		   desc = "Continue",
		   },
		   {
		   '<F6>',
		   function()
			require("dap").restart()
			end,
		   desc = "Continue",
		   },
		   {
			"<F17>", -- <S-F5>
			function()
				require("dap").terminate()
				require("dapui").toggle()
			end,
			desc = "Terminate",
		},
		   { "<F10>", function() require("dap").step_over() end, desc = "Step Over", },
		   { "<F11>", function() require("dap").step_into() end, desc = "Step Into", },
		   { "<F23>", function() require("dap").step_out() end, desc = "Step Out", },
		   { "<localleader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", },
		   {"<localleader>dc", function()
			require'dap'.clear_breakpoints()
			vim.notify("Cleared Breakpoints", 2, { title="Debugger", icon = require('utils.icons').debug })
		end, desc = "clear breakpoints"},
		   { "<localleader>dR", function() require("dap").run_to_cursor() end, desc = "Run to Cursor"},
		   { "<localleader>dr", "<cmd>DapVirtualTextForceRefresh<cr>", desc = "Force Refresh virtual text"},
		   {"<localleader>di", function()require "dap.ui.widgets".hover() end, desc="information" },
		   { "<localleader>de", function() require("dapui").eval() end, mode = {"n", "v"}, desc = "Evaluate", },
		   { "<localleader>dE", function() require("dapui").eval(vim.fn.input "Expression > ") end, desc = "Evaluate Input", },
		   { "<localleader>dC", function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, desc = "Conditional Breakpoint", },
		   { "<localleader>bl", function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "logpoint breakpoint" },
		   { "<localleader>du", function() require("dapui").toggle() end, desc = "Toggle UI", },
		   -- somehow, these keybindings are not working
		   { "<c-w><c-d>", function() require("dapui").toggle() end, desc = "Toggle Debug UI", },
		   { "<c-w>d", function() require("dapui").toggle() end, desc = "Toggle Debug UI", },
		   { "<c-s-d>", function() require("dapui").toggle() end, desc = "Toggle Debug UI", },
		   -- { "<localleader>db", function() require("dap").step_back() end, desc = "Step Back", },
		   { "<localleader>dg", function() require("dap").session() end, desc = "Get Session", },
		   { "<localleader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables", },
		   { "<localleader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
		   { "<localleader>dp", function() require("dap").pause.toggle() end, desc = "Pause", },
		   { "<localleader>dq", function() require("dap").close() end, desc = "Quit", },
		   { "<localleader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL", },
		   { "<localleader>ds", function() require("dap").continue() end, desc = "Start", },
		   { "<localleader>dw", function()
			require("dapui").elements.watches.add(vim.fn.expand("<cword>"))
		end, desc = "Start", },

		   { "<localleader>dx", function() require("dap").terminate() end, desc = "Terminate", },
		   { "<localleader>dt", function() require("dap").disconnect() end, desc = "Disconnect", },
		   { "<localleader>do", function()
				require("dapui").toggle(2)
				require('dap').repl.close()
			end, desc = "open output", },
		},
		opts = {
		  setup = {
		    osv = function(_, _)
		  	require("core-plugins.dap.lua").setup()
		    end,
		  },
		},
		-- lots of the configuration copied
		-- NOTE: you may be interested in setting justMyCode = false
		config = function(plugin, opts)
			-- set up debugger
			for k, _ in pairs(opts.setup) do
			  opts.setup[k](plugin, opts)
			end
			require("configs.debug")
		end,
	},
}
