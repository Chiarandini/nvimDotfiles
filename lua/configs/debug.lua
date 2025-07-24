--  ╔══════════════════════════════════════════════════════════╗
--  ║                     setup variables                      ║
--  ╚══════════════════════════════════════════════════════════╝
local dap = require("dap")
local dapui = require("dapui") --require('nvim-dap-ui')

-- include dap in extension once loaded.
-- NOTE: assuming that telescope is loaded!

-- for now, putting these keybinding here as they are not working in the lazy loding
vim.keymap.set('n', '<c-w><c-d>', function() require("dapui").toggle() end, { noremap = true, silent = true , desc=' toggle debugging'})

-- Automatically open the UI when a new debug session is created.

-- for debugging
-- require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

--  ╔══════════════════════════════════════════════════════════╗
--  ║           setup extensions (ui, vritaul text)            ║
--  ╚══════════════════════════════════════════════════════════╝


-- Set up icons.
local icons = {
	Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
	Breakpoint = " ",
	BreakpointCondition = " ",
	BreakpointRejected = { " ", "DiagnosticError" },
	LogPoint = ".>",
}

for name, sign in pairs(icons) do
	sign = type(sign) == "table" and sign or { sign }
	vim.fn.sign_define(
		"Dap" .. name,
		{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
	)
end

dapui.setup({
	-- icons = { expanded = "▾", collapsed = "▸" },
	-- mappings = {
	-- 	open = "o",
	-- 	remove = "d",
	-- 	edit = "e",
	-- 	repl = "r",
	-- 	toggle = "t",
	-- },
	-- layouts = {
	-- 	{
	-- 		elements = {
	-- 			"scopes",
	-- 		},
	-- 		size = 0.3,
	-- 		position = "right",
	-- 	},
	-- 	{
	-- 		elements = {
	-- 			"repl",
	-- 			"breakpoints",
	-- 		},
	-- 		size = 0.3,
	-- 		position = "bottom",
	-- 	},
	-- },
	-- floating = {
	-- 	max_height = nil,
	-- 	max_width = nil,
	-- 	border = "single",
	-- 	mappings = {
	-- 		close = { "q", "<Esc>" },
	-- 	},
	-- },
	-- windows = { indent = 1 },
	-- render = {
	-- 	max_type_length = nil,
	-- },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

--  ┌                                                          ┐
--  │                      configuration                       │
--  └                                                          ┘

--note that mason-dap is setup in configs.lsp (has to be setup after mason)
--  ╔══════════════════════════════════════════════════════════╗
--  ║                                                          ║
--  ║                          setup                           ║
--  ║                                                          ║
--  ╚══════════════════════════════════════════════════════════╝
-- note that nvim-dap-[LANG] does lots of the following configuration and adapter work if
-- you don't want to do it.

dap.configurations = {
	go = {
		{
			type = "go", -- Which adapter to use
			name = "Debug", -- Human readable name
			request = "launch", -- Whether to "launch" or "attach" to program
			program = "${file}", -- The buffer you are focused on when running nvim-dap
		},
		{
			type = "go",
			name = "Debug test (go.mod)",
			request = "launch",
			mode = "test",
			program = "./${relativeFileDirname}",
		},
		{
			type = "go",
			name = "Attach (Pick Process)",
			mode = "local",
			request = "attach",
			processId = require("dap.utils").pick_process,
		},
		{
			type = "go",
			name = "Attach (127.0.0.1:9080)",
			mode = "remote",
			request = "attach",
			port = "9080",
		},
	},
	javascript = {
		{
			type = "node2",
			name = "Launch",
			request = "launch",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
		{
			type = "node2",
			name = "Attach",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
	},
	lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
		},
	}
}

-- require('dap-python').setup('/Users/nathanaelchwojko-srawkey/Library/CloudStorage/-Personal/startup/venv/bin/python3')
require('dap-python').setup('/opt/homebrew/bin/python3')
-- require('dap-python').setup()

-- -- Set JS/TS (same setup)
-- for _, language in ipairs { 'typescript', 'javascript' } do
-- 	dap.configurations[language] = {
-- 		{
-- 			type = 'pwa-node',
-- 			request = 'attach',
-- 			processId = require('dap.utils').pick_process,
-- 			name = 'Attach debugger to existing node process',
-- 			sourceMaps = true,
-- 			cwd = '${workspaceFolder}',
-- 			resolveSourceMapLocations = {
-- 				'${workspaceFolder}/**',
-- 				'!**/node_modules/**',
-- 			},
-- 			outFiles = {
-- 				'${workspaceFolder}/**',
-- 				'!**/node_modules/**',
-- 			},
-- 			skipFiles = { '**/node_modules/**' },
-- 		},
-- 	}
-- end
--  ┌                                                          ┐
--  │                         adapters                         │
--  └                                                          ┘

-- dap.adapters.go = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = vim.fn.stdpath("data") .. '/mason/bin/dlv',
--     args = { "dap", "-l", "127.0.0.1:${port}" },
--   },
-- }
--
-- dap.adapters.node2 = {
--   type = 'executable';
--   command = 'node',
--   args = { vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' };
-- }
--
--
-- dap.adapters.nlua = function(callback, config)
-- 	-- TODO: Understand if it's fine to ignore these errors.
-- 	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
-- end
