--  ╔══════════════════════════════════════════════════════════╗
--  ║                                                          ║
--  ║                        cmp setup                         ║
--  ║                                                          ║
--  ╚══════════════════════════════════════════════════════════╝

-- load variables
local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local icons = require("utils.icons")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

--- To insure functionality of tabbing (not always needed)
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- make autopairs compatible with cmp (no glitches between them)
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local select_opts = { behavior = cmp.SelectBehavior.Select }

-- This is where you add your desired completions. First add the to above list of sources
-- add custom source
require("sources.todos").setup()
require("sources.preambles").setup()
require("sources.images").setup()
-- require('sources.projects')

-- global setting
cmp.setup({
	-- cmp sometimes lag's in huge files. see ~/.config/nvim/lua/settings/fault-management.lua
	enabled = vim.g.cmp_toggle,

	-- luasnip configuation
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	-- pretty window (commented to see if it will affect lag)
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	-- On huge files, cmp has performance issues
	---@diagnostic disable-next-line: missing-fields
	performance = {
		-- throttle = 200,
		fetching_timeout = 500,
		debounce = 200
	},

	-- general mappings
	-- Specify `cmp.config.disable` if you want to remove the default mapping
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),
		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
		["<c-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
		-- ["<CR>"] = cmp.mapping.confirm { select = false }, -- Set `select` to `false` to only confirm explicitly selected items.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- proper tab behavior between cmp, luasnip, and no cmp.
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			-- elseif luasnip.expandable() and luasnip.jumpable(1) then
			-- 	luasnip.jump(1)
				-- elseif cmp.visible() then
				--     cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	-- default sources
	sources = cmp.config.sources({
		{ name = "luasnip" },
		-- { name = 'luasnip', option = { show_autosnippets = true } },
		{ name = "nvim_lsp" }, -- lsp completions (ex. python linter, vimtex hinter, etc.)
		{ name = "luasnip_choice" },
		{ name = "nvim_lua" },
		{ name = "path" },                -- for path completion
		{ name = "spell",         keyword_length = 3 }, -- for spelling
		{ name = "nerdfont" },
		{ name = "calc" },                -- to access a calculator
		{ name = "buffer",        keyword_length = 3 },
	    { name = 'obsidian' },
   		{ name = 'obsidian_new' },

	}, {
		{ name = "buffer" },
	}),


	---@diagnostic disable-next-line: missing-fields
	experimental = {
		-- ghost_text = true,
		-- native_menu = false,
	},
	--NOTE: had lots of fun with this, but but the new update gave lots of nice UI overhauls!
	---@diagnostic disable-next-line: missing-fields
	formatting = {
		fields = {"abbr", "kind", "menu" },
		format = function(entry, vim_item)
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- This concatenates the icons with the name of the item kind
			vim_item.kind = string.format("%s %s", icons.kind_icons[vim_item.kind], vim_item.kind)
			-- this adds extra informatino
			vim_item.menu = ({
				Images = "Image",
				Todos = "Comment",
				Preamble = "Preamble",
				plugins = "Plugins",
				-- nvim_lsp = "[Lsp]",
				-- luasnip = "[Snip]",
				-- path = "[Path]",
				-- emoji = "[Emoji]",
				-- nerdfont = "[Nerd]",
				-- buffer = "[Buf]",
				-- spell = "[Spell]",
				-- plugins = "[Plug]",
				-- calc = "[Calc]",
				-- omni = "[Vimtex]",
				-- vimtex = "[Vimtex]",
				-- git = "[Git]",
				-- Variable = "[Var]",
				-- Todos = "[Comment]",
				-- Preamble = "[Preamble]",
				-- Class = "[Class]",
				-- cmdline = '[cmd]' -- doesn't add any new info
				-- nvim_lsp_signature_help = "[signature]", -- too long
			})[entry.source.name]
			return vim_item
		end,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype(
	"gitcommit",
	---@diagnostic disable-next-line: missing-fields
	{
		sources = cmp.config.sources({
			{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = "buffer" },
		}),
	}
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
	"norg",
	---@diagnostic disable-next-line: missing-fields
	{
		sources = cmp.config.sources({
			{ name = "neorg" },
			{ name = "spell" },
			{ name = "path" },
			{ name = "buffer" },
		}, {
			{ name = "buffer" },
		}),
	}
)

cmp.setup.filetype(
	"vimwiki",
	---@diagnostic disable-next-line: missing-fields
	{
		sources = cmp.config.sources({
			{ name = "calc" },
			{ name = "spell" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
	}
)
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
---@diagnostic disable-next-line: missing-fields
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
---@diagnostic disable-next-line: missing-fields
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

---@diagnostic disable-next-line: missing-fields
cmp.setup.cmdline("e", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "fuzzy_path" },
	}, {
		{ name = "cmdline" },
	}),
})

---@diagnostic disable-next-line: missing-fields
cmp.setup.filetype("tex", {

	sources = cmp.config.sources({
		{ name = "Preamble" },
		{ name = "Images" },
		{ name = "vimtex" }, -- for vimtex
		-- { name = 'omni'},     -- for before vimtex had its own
		-- { name = "luasnip", max_item_count = 10, option = { show_autosnippets = true } },
		-- { name = "buffer",  max_item_count = 10 },
		-- { name = "path" },
		-- { name = "spell",   keyword_length = 3,  max_item_count = 4 }, -- for spelling
		-- { name = 'calc'},      -- to access a calculator
	}),
})

cmp.setup.filetype("lua", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "lazydev" },
		{ name = "luasnip",                option = { show_autosnippets = true } },
		{ name = "plugins" },
		{ name = "nvim_lua" },
		{ name = "path" },
		-- { name = "calc" },
		{ name = "spell",                  keyword_length = 3 },
		{ name = "buffer",                 keyword_length = 3 },
		{ name = "Todos" }, --My custom sources: gives todo-comment completion options
	}),
})

---@diagnostic disable-next-line: missing-fields
cmp.setup.filetype("harpoon", {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "fuzzy_path" },
	}),
})

---@diagnostic disable-next-line: missing-fields
-- cmp.setup.filetype('norg', {
-- 	sources = cmp.config.sources({
-- 		{name = "Images" },
-- 	}),
-- })

---@diagnostic disable-next-line: missing-fields
cmp.setup.filetype("python", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip_choice" },
		{ name = "nvim_lsp" },
		{ name = "luasnip",                option = { show_autosnippets = true } },
		{ name = "path" },
		{ name = "buffer",                 keyword_length = 3 },

		-- My custom sources.
		{ name = "Todos" }, -- Gives todo-comment completion options
	}),
})

---@diagnostic disable-next-line: missing-fields
cmp.setup.filetype({ "typescriptreact", "typescript", "javascript" }, {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip_choice" },
		{ name = "nvim_lsp" },
		{ name = "luasnip",                option = { show_autosnippets = true } },
		{ name = "path" },
		{ name = "buffer",                 keyword_length = 3 },

		-- My custom sources.
		{ name = "Todos" }, -- Gives todo-comment completion options
	}),
})

---@diagnostic disable-next-line: missing-fields
cmp.setup.filetype("dapui_watches", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer",  keyword_length = 3 },
	}),
})
