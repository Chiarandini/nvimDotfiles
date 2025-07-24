--  ╔══════════════════════════════════════════════════════════╗
--  ║                     telescope config                     ║
--  ╚══════════════════════════════════════════════════════════╝

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
--- To open with in Trouble
local trouble = require("trouble.providers.telescope")

local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions
local action_state = require "telescope.actions.state" --for finding path

local open_with_trouble = require("trouble.sources.telescope").open



local change_directory = function(prompt_bufnr)
	local selection = require("telescope.actions.state").get_selected_entry()
	local dir = vim.fn.fnamemodify(selection.path, ":p:h")
	require("telescope.actions").close(prompt_bufnr)
	-- Depending on what you want put `cd`, `lcd`, `tcd`
	vim.cmd(string.format("cd %s", dir))
	print('changed directory to ' .. dir)
  end

local yank_path = function(prompt_bufnr)
	local selection = require("telescope.actions.state").get_selected_entry()
	local dir = vim.fn.fnamemodify(selection.path, ":p:h")
	vim.fn.setreg("*", dir)
	print("copied path to clipboard")
	require("telescope.actions").close(prompt_bufnr)
	-- Depending on what you want put `cd`, `lcd`, `tcd`
end

local yank_entry = function(prompt_bufnr)
	local selection = require("telescope.actions.state").get_selected_entry()
	vim.print(selection)
	local symbol_name = selection.symbol_name
	vim.fn.setreg("\"", symbol_name)
	vim.notify("yanked symbol " .. symbol_name, 2, {title = "Telescope", icon = require('utils.icons').loup})
	require("telescope.actions").close(prompt_bufnr)
	-- Depending on what you want put `cd`, `lcd`, `tcd`
end

local delete_buffer = function(prompt_bufnr)
	-- delete buffer
	local selection = require("telescope.actions.state").get_selected_entry()
	vim.cmd("bdelete" .. selection.bufnr .. "")

	-- force refresh
	-- -- require('telescope.pickers').refresh() -- needs inputs, see  /Users/nathanaelchwojko-srawkey/.local/share/nvim/lazy/telescope.nvim/lua/telescope

	-- janky refresh solution
	-- require('telescope.actions')
	-- require("telescope.actions").close(prompt_bufnr)
	-- require("telescope.builtin").buffers()

	-- print helpful message
	print("buffer " .. selection.bufnr .. " (" .. selection.filename .. ") deleted")
end

local select_and_delete_buffer = function(prompt_bufnr)
	vim.cmd("bdelete " .. prompt_bufnr)
	actions.select_default(prompt_bufnr)
end

local execute_file = function(prompt_bufnr)
	local selection = require("telescope.actions.state").get_selected_entry()
	vim.cmd("!open " .. selection.path)

	require("telescope.actions").close(prompt_bufnr)
end

telescope.setup {
  defaults = {

    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      ".git/",
    },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = execute_file,
		["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        -- ["<c-d>"] = require("telescope.actions").delete_buffer,
        ["<c-y>"] = yank_entry,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<Tab>"] = actions.close,
        ["<S-Tab>"] = actions.close,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = open_with_trouble,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
        ["<esc>"] = actions.close,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.close,
        ["<S-Tab>"] = actions.close,
        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["q"] = actions.close,
        ["dd"] = require("telescope.actions").delete_buffer,
        ["s"] = actions.select_horizontal,
        ["v"] = actions.select_vertical,
        ["t"] = actions.select_tab,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    --live_grep = {
      --theme = "dropdown",
    --},
    --grep_string = {
      --theme = "dropdown",
    --},
    --find_files = {
      --theme = "dropdown",
      --previewer = false,
    --},
    --buffers = {
      --theme = "dropdown",
      --previewer = false,
      --initial_mode = "normal",
    --},
    --planets = {
      --show_pluto = true,
      --show_moon = true,
    --},
    colorscheme = {
      enable_preview = true,
    },
    --lsp_references = {
      --theme = "dropdown",
      --initial_mode = "normal",
    --},
    --lsp_definitions = {
      --theme = "dropdown",
      --initial_mode = "normal",
    --},
    --lsp_declarations = {
      --theme = "dropdown",
      --initial_mode = "normal",
    --},
    --lsp_implementations = {
      --theme = "dropdown",
      --initial_mode = "normal",
    --},
	old_files = {
		  mappings = {
			i = {
			  ["<CR>"] = select_and_delete_buffer,
			  ["<c-d>"] = change_directory,
			  -- TODO: to delete a file, add a prompt to make sure
			  --  ["<c-s-d>"] = delete_file
			  ["<c-y>"] = yank_path,
			}
		  }
		},
	find_files = {
		  mappings = {
			i = {
			  ["<c-d>"] = change_directory,
			  -- TODO: to delete a file, add a prompt to make sure
			  --  ["<c-s-d>"] = delete_file
			  ["<c-y>"] = yank_path,
			}
		  }
		},
	buffers = {
		  mappings = {
			i = {
				["<c-d>"] = delete_buffer,
			}
		  }
		},

    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },

  extensions = {
	  media_files = {
		  -- filetypes whitelist
		  -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		  filetypes = { "pdf", "png", "webp", "jpg", "jpeg"},
		  find_cmd = "rg", -- find command (defaults to `fd`)
		  mappings = {
			  ['i'] = {
				  ['<c-x>'] = function()
						  vim.cmd([[
						  echom 'hello world'
						  " lua =require("telescope.actions.state").get_selected_entry().Path['filename']
						  ]])
				  end
			  }
		  }
	  },
	  file_browser = {
		  theme = "ivy",
		  -- disables netrw and use telescope-file-browser in its place
		  hijack_netrw = true,
		  mappings = {
			  ["i"] = {
				  ["<C-a>"] = fb_actions.create,
				  ["<c-x>"] = fb_actions.open,
				  ["<C-r>"] = fb_actions.rename,
				  ["<C-d>"] = fb_actions.remove,
				  ["<C-s-g>"] = function ()
					  -- for debugging
					  -- vim.cmd([[
					  -- lua =getmetatable(require("telescope.actions.state").get_selected_entry()).cwd
					  -- -- ]])
					  --.Path['filename']
					  local entry_path =getmetatable(action_state.get_selected_entry()).cwd
					  require('telescope.builtin').live_grep({search_dirs={entry_path}})
					end
			  },
		  },
	  },
	  heading = {
		  treesitter = true,
	 },
	 neoclip = {
		 mappings = {
			 ['i'] = {
				 ["<C-j>"] = actions.move_selection_next,
				 ["<C-k>"] = actions.move_selection_previous,
			 }
		 }
	 },
	bookmarks = {},
	undo = {
		-- telescope-undo.nvim config, see below
	},
    bibtex = {
      -- Depth for the *.bib file
      depth = 1,
      -- Custom format for citation label
      custom_formats = {},
      -- Format to use for citation label.
      -- Try to match the filetype by default, or use 'plain'
      format = '',
      -- Path to global bibliographies (placed outside of the project)
      global_files = {},
      -- Define the search keys to use in the picker
      search_keys = { 'author', 'year', 'title' },
      -- Template for the formatted citation
      citation_format = '{{author}} ({{year}}), {{title}}.',
      -- Only use initials for the authors first name
      citation_trim_firstname = true,
      -- Max number of authors to write in the formatted citation
      -- following authors will be replaced by "et al."
      citation_max_auth = 2,
      -- Context awareness disabled by default
      context = true,
      -- Fallback to global/directory .bib files if context not found
      -- This setting has no effect if context = false
      context_fallback = true,
      -- Wrapping in the preview window is disabled by default
      wrap = false,
    },
	-- dap = {},
	sessions_picker = {
      sessions_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),  -- same as '/home/user/.local/share/nvim/session'
    }
	-- ["ui-select"] = {
 --      require("telescope.themes").get_dropdown {
 --        -- even more opts
 --      }},
	--   fzf = {
 --      fuzzy = true,                    -- false will only do exact matching
 --      override_generic_sorter = true,  -- override the generic sorter
 --      override_file_sorter = true,     -- override the file sorter
 --      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
 --                                       -- the default case_mode is "smart_case"
 --    },
  }
}



--note that yabs is configured to integrate with telescope in yabs.lua

-- load file_browser to Telescope
telescope.load_extension("media_files")
telescope.load_extension("notify")
telescope.load_extension("undo")
telescope.load_extension("file_browser")
telescope.load_extension('heading')
telescope.load_extension("bibtex")
telescope.load_extension('neoclip')
telescope.load_extension('bookmarks')
telescope.load_extension("ui-select")
telescope.load_extension("fidget")
-- telescope.load_extension("noice")
telescope.load_extension('sessions_picker')
telescope.load_extension('dap')
telescope.load_extension('zotero')
-- telescope.load_extension('harpoon')
-- telescope.load_extension('vimwiki')
-- telescope.load_extension('fzf')
