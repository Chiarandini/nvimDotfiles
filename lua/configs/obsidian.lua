local obsidian = require("obsidian")
obsidian.setup({
  workspaces = {
		{
			name = "nate",
			path = "~//Documents/NateObsidianVault/",
			-- strict = true,
		},
		-- {
		-- 	name = "philosohpy",
		-- 	path = "~//Documents/NateObsidianVault/philosophyVault/",
		-- 	-- strict = true,
		-- },
  },
	-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    -- Enables completion using nvim_cmp
    nvim_cmp = true,
    -- Enables completion using blink.cmp
    blink = false,
    -- Trigger completion at 2 chars.
    -- min_chars = 3,
    -- Set to false to disable new note creation in the picker
    create_new = true,
  },
  picker = {
		-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
		name = "telescope.nvim",
		-- Optional, configure key mappings for the picker. These are the defaults.
		-- Not all pickers support all mappings.
		note_mappings = {
			-- Create a new note from your query.
			new = "<c-n>",
			-- Insert a link to the selected note.
			insert_link = "<C-l>",
		},
		tag_mappings = {
			-- Add tag(s) to current note.
			tag_note = "<C-x>",
			-- Insert a tag at the current location.
			insert_tag = "<C-l>",
		},
  },
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
  	-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
  	-- In this case a note with the title 'My new note' will be given an ID that looks
  	-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
  	local suffix = ""
  	if title ~= nil then
  		-- If title is given, transform it into valid file name.
  		return title:gsub(" ", "_"):lower()
  	else
  		-- If title is nil, just add 4 random uppercase letters to the suffix.
  		for _ = 1, 4 do
  			suffix = suffix .. string.char(math.random(65, 90)) .. "-RENAME_ME"
  		end
  		return tostring(os.time()) .. "-" .. suffix
  	end
  end,
  templates = {
  	folder = "templates",
  	date_format = "%Y-%m-%d-%a",
  	time_format = "%H:%M",
  },
  -- Optional, by default when you use `:Obsidian followlink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  ---@param url string
  follow_url_func = function(url)
  	-- Open the URL in the default web browser.
  	vim.fn.jobstart({ "open", url }) -- Mac OS
  	-- vim.fn.jobstart({"xdg-open", url})  -- linux
  	-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
  	-- vim.ui.open(url) -- need Neovim 0.10.0+
  end,

  -- Optional, by default when you use `:Obsidian followlink` on a link to an image
  -- file it will be ignored but you can customize this behavior here.
  ---@param img string
  follow_img_func = function(img)
  	vim.fn.jobstart({ "open", img }) -- Mac OS quick look preview
  	-- vim.fn.jobstart({"xdg-open", url})  -- linux
  	-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
  end,
   ui = {
    enable = true, -- set to false to disable all additional syntax features
    ignore_conceal_warn = false, -- set to true to disable conceallevel specific warning
    update_debounce = 200, -- update delay after a text change (in milliseconds)
    max_file_length = 5000, -- disable UI features for files with more than this many lines
    -- Define how various check-boxes are displayed
    checkboxes = {
      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      ["!"] = { char = "", hl_group = "ObsidianImportant" },
      -- Replace the above with this if you don't have a patched font:
      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

      -- You can also add more custom ones...
    },
    -- Use bullet marks for non-checkbox lists.
    bullets = { char = "•", hl_group = "ObsidianBullet" },
    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    -- Replace the above with this if you don't have a patched font:
    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    reference_text = { hl_group = "ObsidianRefText" },
    highlight_text = { hl_group = "ObsidianHighlightText" },
    tags = { hl_group = "ObsidianTag" },
    block_ids = { hl_group = "ObsidianBlockID" },
    hl_groups = {
      -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
      ObsidianTodo = { bold = true, fg = "#f78c6c" },
      ObsidianDone = { bold = true, fg = "#89ddff" },
      ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      ObsidianTilde = { bold = true, fg = "#ff5370" },
      ObsidianImportant = { bold = true, fg = "#d73128" },
      ObsidianBullet = { bold = true, fg = "#89ddff" },
      ObsidianRefText = { underline = true, fg = "#c792ea" },
      ObsidianExtLinkIcon = { fg = "#c792ea" },
      ObsidianTag = { italic = true, fg = "#89ddff" },
      ObsidianBlockID = { italic = true, fg = "#89ddff" },
      ObsidianHighlightText = { bg = "#75662e" },
    },
  },
})

local AsyncExecutor = require("obsidian.async").AsyncExecutor
local log = require "obsidian.log"
local search = require "obsidian.search"
local iter = vim.iter
local util = require "obsidian.util"
local channel = require("plenary.async.control").channel

---@param client obsidian.Client
local function default_to_first_link(client)
  -- Gather all unique raw links (strings) from the buffer.
  ---@type table<string, integer>
  local links = {}
  for lnum, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, true)) do
    for match in iter(search.find_refs(line, { include_naked_urls = true, include_file_urls = true })) do
      local m_start, m_end = unpack(match)
      local link = string.sub(line, m_start, m_end)
      if not links[link] then
        links[link] = lnum
      end
    end
  end

  local link_keys = vim.tbl_keys(links)

  -- If there are no links, show an error
  if #link_keys == 0 then
    log.err "No links found in buffer"
    return
  end

  -- If there's only one link, resolve and execute it directly
  if #link_keys == 1 then
    local single_link = link_keys[1]
    client:resolve_link_async(single_link, function(...)
      for res in iter { ... } do
        local icon, icon_hl
        if res.url ~= nil then
          icon, icon_hl = util.get_icon(res.url)
        end
        local entry = {
          value = single_link,
          display = res.name,
          filename = res.path and tostring(res.path) or nil,
          icon = icon,
          icon_hl = icon_hl,
          lnum = res.line,
          col = res.col,
        }
        client:follow_link_async(entry)
        break -- Only take the first resolution
      end
    end)
    return
  end

  -- Multiple links - use picker
  local picker = client:picker()
  if not picker then
    log.err "No picker configured"
    return
  end

  local executor = AsyncExecutor.new()

  executor:map(
    function(link)
      local tx, rx = channel.oneshot()

      ---@type obsidian.PickerEntry[]
      local entries = {}

      client:resolve_link_async(link, function(...)
        for res in iter { ... } do
          local icon, icon_hl
          if res.url ~= nil then
            icon, icon_hl = util.get_icon(res.url)
          end
          table.insert(entries, {
            value = link,
            display = res.name,
            filename = res.path and tostring(res.path) or nil,
            icon = icon,
            icon_hl = icon_hl,
            lnum = res.line,
            col = res.col,
          })
        end

        tx()
      end)

      rx()
      return unpack(entries)
    end,
    link_keys,
    function(results)
      vim.schedule(function()
        -- Flatten entries.
        local entries = {}
        for res in iter(results) do
          for r in iter(res) do
            entries[#entries + 1] = r
          end
        end

        -- Sort by position within the buffer.
        table.sort(entries, function(a, b)
          return links[a.value] < links[b.value]
        end)

        -- Launch picker.
        picker:pick(entries, {
          prompt_title = "Links",
          callback = function(link)
            client:follow_link_async(link)
          end,
        })
      end)
    end
  )
end


local client = require('obsidian').get_client()

vim.keymap.set('n', '<leader>ol',function() default_to_first_link(client) end, {desc= "follow link"})
vim.keymap.set('i', '<c-s>', '<c-o>:ObsidianQuickSwitch<cr>')
vim.keymap.set('n', '<space>oq', '<cmd>ObsidianQuickSwitch<cr>', {desc = "obsidian quick switch"})
