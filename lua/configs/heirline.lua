-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local icons = require("utils.icons")
local semiCircles = { "", "" }

-- Want to match gruvbox explicitly, but to still work with other colourschemes
local gruvbox_bg, gruvbox_text

-- Try to load gruvbox colors
local success, gruvbox = pcall(require, "gruvbox")
if success then
  gruvbox_bg = gruvbox.palette.dark0
  gruvbox_text = gruvbox.palette.light1
else
  -- Fallback colors
  gruvbox_bg = "#282828"  -- Default dark background
  gruvbox_text = "#ebdbb2" -- Default light text color
end

-- NOTE: there is an autocmd defined in the autocmd file
-- (lua/settings/autocmd.lua) to trigger toggles for the components
vim.g.heirline_pdfsize_show = false
vim.g.heirline_git_show = true
vim.g.heirline_directory_show = false
vim.g.heirline_lsp_show = true
vim.g.heirline_proj_relative_dir_show = false
vim.g.toggle_name_or_project_relative = true

local priority = {
  max = 4,
  high = 3,
  mid = 2,
  low = 1,
  none = 0,
}
-- all colours
-- {{

local lspColor = {
  lua = "#718ECF",
  tex = "#8CAC60",
  typescriptreact = "#0C79B3",
  javascript = "#0C79B3",
  python = "#FFD141",
}
local colors = {
  -- {{
  default_gray = "#333333",
  light_gray = "#504944",
  text_gray = gruvbox_text, "#CDB89A",
  text_unselected = "#7C6F64",
  text_light_gray = "#CDB89A", --#C5AF92
  light_green = "#8BBA7F",
  light_red = "#F2584B",
  light_orange = "#FFE28B",
  light_blue = "#4DB6E6",
  medium_blue = "#2B8CBC", -- #5EC0E1
  default_blue = "#153E5B",
  yellow = "#E9B144",
  bright_bg = utils.get_highlight("Folded").bg,
  bright_fg = utils.get_highlight("Folded").fg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = "#AFDF01",
  dark_green = "#056100",
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  orange = "#FFA500",
  git_add = "#B9BB25",
  git_change = "#8DC07C",
  git_del = "#FB4A34",

  -- Refactored & New Colors
  visual_orange = "#FF8700",
  visual_select_orange = "#FF9933",
  command_line = "#B8BB26", -- #AFDF01", #B8BB26, #689D6A, #8EC07C
  command_ex_line = "#BEEF01",
  select_block_orange = "#FFD766",
  replace_variation_red = "#F04C4C",
  insert_completion_blue = "#7AC8F0",
  normal_insert_green = "#9CC901",
  normal_terminal_green = "#A1C101",
  terminal_blue = "#B16286", -- "#61AEE4", , #4FB4A7,#D65D0E
  -- }}
}

local mode_names = {
  -- {{
  n = "N",
  no = "N?",
  nov = "N?",
  noV = "N?",
  ["no\22"] = "N?",
  niI = "Ni",
  niR = "Nr",
  niV = "Nv",
  nt = "Nt",
  v = "V",
  vs = "Vs",
  V = "V_",
  Vs = "Vs",
  ["\22"] = "^V",
  ["\22s"] = "^V",
  s = "S",
  S = "S_",
  ["\19"] = "^S",
  i = "I",
  ic = "Ic",
  ix = "Ix",
  R = "R",
  Rc = "Rc",
  Rx = "Rx",
  Rv = "Rv",
  Rvc = "Rv",
  Rvx = "Rv",
  c = "C",
  cv = "Ex",
  r = "...",
  rm = "M",
  ["r?"] = "?",
  ["!"] = "!",
  t = "T",
  -- }}
}

local mode_colors = {
  -- {{
  -- Base Modes
  n = colors.green,
  i = colors.light_blue,
  v = colors.visual_orange,
  V = colors.visual_orange,
  s = colors.light_orange,
  S = colors.light_orange,
  R = colors.red,
  c = colors.command_line,
  t = colors.terminal_blue,

  -- Normal Mode Variations
  no = colors.light_orange, -- Operator-pending
  nov = colors.light_orange,
  noV = colors.light_orange,
  ["no\22"] = colors.light_orange,
  niI = colors.normal_insert_green,
  niR = colors.normal_insert_green,
  niV = colors.normal_insert_green,
  nt = colors.normal_terminal_green,

  -- Visual Mode Variations
  vs = colors.visual_select_orange,
  Vs = colors.visual_select_orange,
  ["\22"] = colors.cyan, -- Visual Block
  ["\22s"] = colors.cyan,

  -- Select Mode Variations
  ["\19"] = colors.select_block_orange, -- Select Block

  -- Insert Mode Variations
  ic = colors.insert_completion_blue,
  ix = colors.insert_completion_blue,

  -- Replace Mode Variations
  r = colors.red,
  Rv = colors.replace_variation_red, -- Virtual Replace
  Rc = colors.replace_variation_red,
  Rx = colors.replace_variation_red,
  Rvc = colors.replace_variation_red,
  Rvx = colors.replace_variation_red,

  -- Command Mode Variations
  cv = colors.command_ex_line,

  -- Other Modes
  rm = colors.yellow, -- More prompt
  ["r?"] = colors.light_orange, -- Confirmation prompt
  ["!"] = colors.yellow, -- Shell
  -- }}
}
-- }}

-- ╔═══════════════════════╗
-- ║ Statusline Components ║
-- ╚═══════════════════════╝

-- spacing and Seperating components
-- {{
local Align = { provider = "%=" }
local Seperator = { flexible = priority.mid, { provider = "|" }, { provider = "" } }
local Space = { provider = " " }
-- local Space = { provider = " ", hl = {fg = colors.default_gray} }
-- }}

-- luasnip jump detecting (Snippets)
-- {{
local Jumpable = {
  -- check that we are in insert or select mode
  condition = function()
    return vim.tbl_contains({ "s", "i" }, vim.fn.mode())
  end,
  provider = function()
    local forward = require("luasnip").jumpable(1) and " " or ""
    local backward = require("luasnip").jumpable(-1) and " " or ""
    return backward .. forward
  end,
  hl = { fg = "green", bold = true },
}
-- }}

-- SearchResults
-- {{
local SearchResults = {
  condition = function(self)
    local lines = vim.api.nvim_buf_line_count(0)
    if lines > 50000 then -- too prevent lag
      return
    end

    local query = vim.fn.getreg("/")
    if query == "" then -- to prevent empty queries
      return
    end

    if query:find("@") then
      return
    end

    if query:find("\\v") then
      return -- don't do regex, it breaks down
    end

    local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
    local active = false
    if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
      active = true
    end
    if not active then
      return
    end

    query = query:gsub([[^\V]], "")
    query = query:gsub([[\<]], ""):gsub([[\>]], "")

    self.query = query
    self.count = search_count
    return true
  end,
  {
    provider = function(self)
      return "%7("
          .. table.concat({
            " ",
            self.count.current,
            "/",
            self.count.total,
            " ",
          })
          .. "%)"
    end,
  },
  Space, -- A separator after, if section is active, without highlight.
}
-- }}

-- readonly flag
-- {{
local ReadOnlyFlag = {
  condition = function()
    return not vim.bo.modifiable or vim.bo.readonly
  end,
  hl = { force = true, fg = colors.light_red, bg = colors.light_gray },
  provider = "",
}
-- }}

local OilCircle = {
  condition = function()
    return vim.o.filetype == "oil"
  end,

  hl = { fg = colors.default_blue },

  provider = function()
    return "Oil"
  end,
}

-- mode selector (ViMode)
-- {{
local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,

  utils.surround(semiCircles, function()
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    local has_luasnip, luasnip = pcall(require, "luasnip")
    if has_luasnip and luasnip.jumpable() then
      return colors.light_green
    end
    return mode_colors[mode]
  end, {
    hl = function(self)
      local mode = self.mode:sub(1, 1) -- get only the first mode character
      local has_luasnip, luasnip = pcall(require, "luasnip")
      if has_luasnip and luasnip.jumpable() then
        return { bg = colors.light_green, fg = colors.dark_green, bold = true }
      end
      return { bg = mode_colors[mode], fg = colors.dark_green, bold = true }
      -- local color = self:mode_color() -- here!
      -- return { fg = color, bold = true }
    end,
    fallthrough = false, -- stop at first child that evaluates to true
    SearchResults,
    OilCircle,
    {

      flexible = priority.high,
      -- show the large bar
      {
        provider = "%7(%)",
      },
      -- show the mid-size bar
      {
        provider = "%3(%)",
      },
      {
        -- show the small bar
        provider = "%1(%)",
      },
      {
        -- show the circle
        provider = "%(%)",
      },
    },
  }),
  -- provider = function(self)
  --     -- return " %5("..self.mode_names[self.mode].."%)"
  --     return " %5(%)"
  -- end,

  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  -- Re-evaluate the component only on ModeChanged event!
  -- Also allows the statusline to be re-evaluated when entering operator-pending mode
  -- update = {
  --     "ModeChanged",
  --     pattern = "*:*",
  --     callback = vim.schedule_wrap(function()
  --         vim.cmd("redrawstatus")
  --     end),
  -- },
}

-- }}

-- filename (incl. work dir)
-- {{
local save_warning = "Not saving in same directory!"

local function warning_popup(text)
  local mouse_pos = vim.fn.getmousepos()
  local opts = {
    relative = "editor",
    row = mouse_pos.screenrow,
    col = mouse_pos.screencol,
    width = string.len(text) + 2,
    height = 1,
    style = "minimal",
    border = "rounded",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })
  vim.api.nvim_set_option_value("modifiable", false, { scope = "local", buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { scope = "local", buf = buf })

  local win = vim.api.nvim_open_win(buf, false, opts)

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })

  vim.api.nvim_set_current_win(win)
end

local function ProjRelativeFilename()
  local gitPath = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";")
  local filePath = vim.fn.expand("%:p:h")
  local relativePath = filePath:replace(gitPath, "")
  if relativePath ~= "" then
    return relativePath
  end
  return vim.api.nvim_buf_get_name(0)
end

-- vim.g.TEMPORARYGLOBAL = true
local function OilRelativeFilename()
  local oil_prefix = "oil:///"
  local path = string.sub(vim.fn.expand("%:p:h"), #oil_prefix + 1)
  local gitPath = vim.fn.finddir(".git/..", path .. ";")
  local filePath = vim.fn.expand("%:p")
  local relativePath = filePath:replace(gitPath, "")
  -- if vim.g.TEMPORARYGLOBAL == true then
  --   print('gitpath: ' .. gitPath)
  --   print('filepath: ' .. filePath)
  --   print('relativepath: ' .. relativePath)
  --   vim.g.TEMPORARYGLOBAL = false
  -- end
  if relativePath ~= "" then
    return relativePath
  end
  return vim.api.nvim_buf_get_name(0)
end

-- cur working dir
local WorkDir = {
  init = function(self)
    -- (vim.fn.haslocaldir(0) == 1 and "l" or "g") ..
    self.icon = " "
    -- local cwd = vim.fn.getcwd(0)
    self.cwd = ProjRelativeFilename()
  end,
  condition = function()
    return vim.g.heirline_directory_show
  end,
  hl = { fg = "orange", bold = true },

  flexible = priority.high,

  {
    -- evaluates to the full-lenth path
    provider = function(self)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. self.cwd .. trail
    end,
  },
  {
    -- evaluates to the shortened path
    provider = function(self)
      local cwd = vim.fn.pathshorten(self.cwd)
      local trail = self.cwd:sub(-1) == "/" and "" or "/"
      return self.icon .. cwd .. trail
    end,
  },
  {
    -- evaluates to "", hiding the component
    provider = "",
  },
}

-- We can now define some children separately and add them later

local FileIcon = {
  init = function(self)
    local filename = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color =
        require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local BufNotCwdWarning = {
  condition = function()
    local relativeFilename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
    return relativeFilename ~= filename
  end,
  on_click = {
    callback = function()
      warning_popup(save_warning)
    end,
    name = "heirline_save_warning",
  },
  provider = " " .. icons.warning .. " ",
  hl = { fg = colors.red },
}

local CmpCompletionList = {
  condition = function()
    local ok, _ = pcall(require, "nvim-cmp")
    if ok then
      return true
    end
  end,
  -- at some point, would like to pop up the status window
  -- on_click = {
  --   callback = function()
  --    HERE
  --   end,
  --   name = "heirline_save_warning",
  -- },
  provider = " " .. icons.event .. " ",
  hl = { fg = colors.orange },
}

local FileName = {
  on_click = {
    callback = function()
      vim.cmd("!open .")
    end,
    name = "heirline_file_explorer",
  },
  provider = function(self)
    -- either get filename or get it relative to project:
    if vim.g.heirline_proj_relative_dir_show then
      return ProjRelativeFilename()
    end
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
    if filename == "" then
      return "[No Name]"
    end

    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation

    -- if not conditions.width_percent_below(#filename, 0.25) then
    --   filename = vim.fn.pathshorten(filename)
    -- end
    return filename
  end,
  hl = { fg = colors.text_gray },
}

local ChangeFlag = {
  condition = function()
    return vim.bo.modified
  end,

  hl = { fg = "orange" },

  on_click = {
    callback = function()
      vim.cmd("DiffOrig")
    end,
    name = "heirline_unsaved_diff",
  },

  provider = icons.pencil,
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { force = true, fg = colors.light_orange }
    end
  end,
}

local FileNameBlock = {
  -- let's first set up some attributes needed by this component and its children
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,

  WorkDir,
  {
    BufNotCwdWarning,
    utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    { provider = "%<" },                   -- this means that the statusline is cut here when there's not enough space
  },
}

local OilBuffer = {
  -- let's first set up some attributes needed by this component and its children
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,

  on_click = {
    callback = function()
      vim.cmd("!open .")
    end,
    name = "heirline_file_explorer",
  },
  {
    provider = function()
      local path = OilRelativeFilename()
      local oil_prefix = "oil:///"
      local last_slash_index = string.match(path, "(.*)/[^/]+/?$")
      if last_slash_index then
        return string.sub(last_slash_index, #oil_prefix + 1) .. "/"
      end
      return string.sub(path, #oil_prefix + 1)
    end,
    hl = { fg = "orange", bold = true },
  },
  {
    provider = function(self)
      local buf_name = vim.api.nvim_buf_get_name(0)
      local oil_prefix = "oil:///"
      local path = string.sub(buf_name, #oil_prefix + 1)
      local dir_name = string.match(path, "([^/]+)/?$")
      return dir_name .. "/"
    end,
  },
  hl = { fg = colors.text_gray },
}

-- }}

-- file size
-- {{
local FileSize = {
  flexible = priority.none,
  {
    provider = function()
      -- stackoverflow, compute human readable file size
      local suffix = { "b", "k", "M", "G", "T", "P", "E" }
      local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
      fsize = (fsize < 0 and 0) or fsize
      if fsize < 1024 then
        return fsize .. suffix[1]
      end
      local i = math.floor((math.log(fsize) / math.log(1024)))
      return string.format("%.3g%s", fsize / math.pow(1024, i), suffix[i + 1])
    end,
  },
  { provider = "" },
}

-- }}

-- file last modified
-- {{
local FileLastModified = {
  -- did you know? Vim is full of functions!
  provider = function()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    return (ftime > 0) and os.date("%c", ftime)
  end,
}

-- }}

-- file pos and % (Ruler)
-- {{
local Pos = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  flexible = priority.high,
  hl = function(self)
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    return { bg = mode_colors[mode], fg = colors.dark_green, bold = true }
  end,
  {
    { provider = " " },
    provider = "%7(%l:%2c%)",
    { provider = " " },
  },
  { provider = "%7(%l:%2c%)" },
}

local Percentage = {
  flexible = priority.mid,
  { provider = " %p%%" },
  { provider = "" },
}
-- }}

-- snacks profiler (problem is that the lualine format is wrong)
-- local SnacksProfiler = {
--   condition = function()
--     return true
--   end,
--   {
--     provider = function()
--     return require('snacks').profiler.status()
--   end
--   },
-- }
-- attached lsp
-- {{
local LSPActive = {
  condition = function()
    -- print('condition: ' .. conditions.lsp_attached())
    return conditions.lsp_attached() and vim.g.heirline_lsp_show
  end,
  -- update = { "LspAttach", "LspDetach", "WinResized", 'User', pattern = 'HeirlineLspToggle'},
  on_click = {
    callback = function()
      vim.defer_fn(function()
        vim.cmd("LspInfo")
      end, 100)
    end,
    name = "heirline_LSP",
  },

  hl = function()
    local filetype = vim.bo.filetype
    if not lspColor[filetype] then
      return { bold = true, fg = "white" }
    end
    return { bold = true, fg = lspColor[filetype] }
  end,

  flexible = priority.mid,
  { -- render all the servers
    provider = function()
      local names = {}
      for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
        if server.name == "null-ls" then
          goto continue
        end
        table.insert(names, server.name)
        ::continue::
      end
      return icons.nvim_lsp .. "(" .. table.concat(names, ", ") .. ")"
    end,
  },
  { -- render just that the lsp is active
    provider = icons.nvim_lsp,
  },
}
-- }}

-- diagnostics
-- {{

local diagWithIcons = {
  {
    provider = icons.diagnostics .. "(",
  },
  { -- ERRORS
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. " " .. self.errors)
    end,
    hl = { fg = colors.diag_error },
  },
  {
    condition = function(self)
      -- something to the right of errors
      return self.errors > 0 and (self.warnings > 0 or self.info > 0 or self.hints > 0)
    end,
    provider = " ",
  },
  { -- WARNINGS
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. " " .. self.warnings)
    end,
    hl = { fg = colors.diag_warn },
  },
  {
    condition = function(self)
      return (self.errors > 0 or self.warnings > 0) and (self.info > 0 or self.hints > 0)
    end,
    provider = " ",
  },
  { -- INFO
    provider = function(self)
      return self.info > 0 and (self.info_icon .. " " .. self.info)
    end,
    hl = { fg = colors.diag_info },
  },
  {
    condition = function(self)
      return (self.errors > 0 or self.warnings > 0 or self.info > 0) and self.hints > 0
    end,
    provider = " ",
  },
  { -- HINT
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. " " .. self.hints)
    end,
    hl = { fg = colors.diag_hint },
  },
  {
    provider = ")",
  },
}

local diagWithoutIcons = {
  {
    provider = "(",
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and self.errors
    end,
    hl = { fg = colors.diag_error },
  },
  {
    provider = function(self)
      return self.warnings > 0 and self.warnings
    end,
    hl = { fg = colors.diag_warn },
  },
  {
    provider = function(self)
      return self.info > 0 and self.info
    end,
    hl = { fg = colors.diag_info },
  },
  {
    provider = function(self)
      return self.hints > 0 and self.hints
    end,
    hl = { fg = colors.diag_hint },
  },
  {
    provider = ")",
  },
}

local Diagnostics = {

  condition = conditions.has_diagnostics,

  on_click = {
    callback = function()
      require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
      -- or
      -- vim.diagnostic.setqflist()
    end,
    name = "heirline_diagnostics",
  },

  static = {
    error_icon = icons.error,
    warn_icon = icons.warning,
    info_icon = icons.info,
    hint_icon = icons.bulb,
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter", "WinResized", "InsertEnter", "InsertLeave" },

  hl = { fg = colors.light_red },
  flexible = priority.mid,
  diagWithIcons,
  diagWithoutIcons,
}
-- }}

-- git changes
-- {{

local GitChanges = {
  init = function(self)
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  condition = function()
    return conditions.is_git_repo() and vim.g.heirline_git_show
  end,
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = colors.git_add },
  },
  {
    condition = function(self)
      return self.status_dict.changed
    end,
    provider = " ",
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = colors.yellow },
  },
  {
    condition = function(self)
      return self.status_dict.removed ~= 0
    end,
    provider = " ",
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = colors.git_del },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
  },
}

local GitChangesMinimal = {
  init = function(self)
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  condition = function()
    return conditions.is_git_repo() and vim.g.heirline_git_show
  end,
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and count
    end,
    hl = { fg = colors.git_add },
  },
  {
    condition = function(self)
      return self.status_dict.changed
    end,
    provider = " ",
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and count
    end,
    hl = { fg = colors.yellow },
  },
  {
    condition = function(self)
      return self.status_dict.removed ~= 0
    end,
    provider = " ",
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and count
    end,
    hl = { fg = colors.git_del },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
  },
}

local GitBranchName = {
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
  end,
  condition = function()
    return conditions.is_git_repo() and vim.g.heirline_git_show
  end,
  provider = function(self)
    return "  " .. self.status_dict.head
  end,
  hl = { bold = true },
}

local GitBlock = {
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
  end,
  condition = function()
    return conditions.is_git_repo() and vim.g.heirline_git_show
  end,
  -- update = {"User", pattern ="HeirlineGitToggle", "BufWritePre", "BufWritePost", 'BufFilePre'},

  on_click = {
    callback = function()
      -- If you want to use Fugitive:
      -- vim.cmd("G")

      -- If you prefer Lazygit
      -- use vim.defer_fn() if the callback requires
      -- opening of a floating window
      -- (this also applies to telescope)
      vim.defer_fn(function()
        vim.cmd("lua require('lazy.util').float_term('lazygit')")
      end, 100)
    end,
    name = "heirline_git",
  },

  hl = { fg = "orange" },

  flexible = priority.low,

  -- render everything for Git
  {
    GitBranchName,
    GitChanges,
  },

  -- Render only the numbers
  GitChangesMinimal,

  -- render nothing
  { provider = "" },
}
-- }}

-- DAP status
-- {{
local DAPMessages = {
  condition = function()
    if require("lazy.core.config").plugins["nvim-dap"]._.loaded then
      local session = require("dap").session()
      return session ~= nil
    end
    return false
  end,
  provider = function()
    return " " .. require("dap").status() .. " "
  end,
  hl = utils.get_highlight("Debug"),
  -- see Click-it! section for clickable actions
}
-- }}

-- DAP controls
-- {{
-- Note that we add spaces separately, so that only the icon characters will be clickable
local DAPControls = {
  condition = function()
    local session = require("dap").session()
    return session ~= nil
  end,
  provider = function()
    return " " .. require("dap").status() .. " "
  end,
  hl = utils.get_highlight("Debug"),
  {
    provider = "",
    on_click = {
      callback = function()
        require("dap").step_into()
      end,
      name = "heirline_dap_step_into",
    },
  },
  { provider = " " },
  {
    provider = "",
    on_click = {
      callback = function()
        require("dap").step_out()
      end,
      name = "heirline_dap_step_out",
    },
  },
  { provider = " " },
  {
    provider = " ",
    on_click = {
      callback = function()
        require("dap").step_over()
      end,
      name = "heirline_dap_step_over",
    },
  },
  { provider = " " },
  {
    provider = "ﰇ",
    on_click = {
      callback = function()
        require("dap").run_last()
      end,
      name = "heirline_dap_run_last",
    },
  },
  { provider = " " },
  {
    provider = "",
    on_click = {
      callback = function()
        require("dap").terminate()
        require("dapui").close({})
      end,
      name = "heirline_dap_close",
    },
  },
  { provider = " " },
  -- icons:       ﰇ  
}
-- }}

-- filetype
-- {{
local FileType = {
  provider = function()
    return vim.bo.filetype
  end,
  hl = { fg = utils.get_highlight("Type").fg, bold = true },
}
-- }}

-- recording macro
-- {{
local MacroRec = {
  condition = function()
    return vim.fn.reg_recording() ~= "" -- and vim.o.cmdheight == 0
  end,
  provider = " ",
  hl = { fg = "orange", bold = true },
  utils.surround({ "[", "]" }, nil, {
    provider = function()
      return vim.fn.reg_recording()
    end,
    hl = { fg = "green", bold = true },
  }),
  update = {
    "RecordingEnter",
    "RecordingLeave",
    "InsertEnter",
    "InsertLeave",
  },
}
-- }}

-- show key sequence (showCmd)
-- {{
local ShowCmd = {
  condition = function()
    return vim.o.cmdheight == 0
  end,
  provider = ":%3.5(%S%)",
}
-- }}

-- help filename
-- {{
local HelpFileName = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ":t")
  end,
  hl = { fg = colors.blue },
}
-- }}

-- terminal info
-- {{
local TerminalName = {
  -- we could add a condition to check that buftype == 'terminal'
  -- or we could do that later (see #conditional-statuslines below)
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    if tname:match("dap%-terminal") then
      return " dap-terminal"
    end
    return " " .. tname
  end,
  hl = { fg = colors.green, bg = colors.default_gray, bold = true },
}
-- }}

-- close button
-- {{
local CloseButton = {
  condition = function(self)
    return not vim.bo.modified
  end,
  -- a small performance improvement:
  -- re register the component callback only on layout/buffer changes.
  update = { "WinNew", "WinClosed", "BufEnter" },
  { provider = " " },
  {
    provider = "",
    hl = { fg = "gray" },
    on_click = {
      minwid = function()
        return vim.api.nvim_get_current_win()
      end,
      callback = function(_, minwid)
        vim.api.nvim_win_close(minwid, true)
      end,
      name = "heirline_winbar_close_button",
    },
  },
}
-- }}

-- Lazy plugin has updates
-- {{
local Lazy = {
  condition = require("lazy.status").has_updates,
  -- update = { "User", pattern = "LazyUpdate", "WinResized" },

  on_click = {
    callback = function()
      require("lazy").home()
    end,
    name = "update_plugins",
  },
  hl = { fg = "#ff9e64" },

  flexible = priority.none,
  {
    provider = function()
      return require("lazy.status").updates() .. " "
    end,
  },
  {
    provider = "",
  },
}
--}}

-- Overseer
-- {{
local Overseer = {
  condition = function()
    local ok, _ = pcall(require, "overseer")
    if ok then
      return true
    end
  end,
  init = function(self)
    self.overseer = require("overseer")
    self.tasks = self.overseer.task_list
    self.STATUS = self.overseer.constants.STATUS
  end,
  static = {
    symbols = {
      ["FAILURE"] = "  ",
      ["CANCELED"] = "  ",
      ["SUCCESS"] = "  ",
      ["RUNNING"] = " 省",
    },
    colors = {
      ["FAILURE"] = "red",
      ["CANCELED"] = "gray",
      ["SUCCESS"] = "green",
      ["RUNNING"] = "yellow",
    },
  },
  {
    condition = function(self)
      return #self.tasks.list_tasks() > 0
    end,
    {
      provider = function(self)
        local tasks_by_status =
            self.overseer.util.tbl_group_by(self.tasks.list_tasks({ unique = true }), "status")

        for _, status in ipairs(self.STATUS.values) do
          local status_tasks = tasks_by_status[status]
          if self.symbols[status] and status_tasks then
            self.color = self.colors[status]
            return self.symbols[status]
          end
        end
      end,
      hl = function(self)
        return { fg = self.color }
      end,
    },
  },
}
-- }}

-- vimtex compiler status
-- {{
local VimtexCompilerStatus = {
  init = function(self)
    ---@diagnostic disable-next-line: undefined-field
    self.status = vim.b.vimtex.compiler.status
    self.color = "white" -- default
  end,
  static = {
    compileColors = {
      compiling = colors.orange,
      done = colors.light_green,
      error = colors.light_red,
    },
  },
  condition = function()
    ---@diagnostic disable-next-line: undefined-field
    return vim.b.vimtex ~= nil and vim.b.vimtex.compiler ~= nil
  end,
  flexible = priority.max,
  hl = function(self)
    local color = ""
    if self.status == 1 then
      color = self.compileColors.compiling
    elseif self.status == 2 then
      color = self.compileColors.done
    elseif self.status == 3 then
      color = self.compileColors.error
    end
    return { fg = color }
  end,
  provider = function(self)
    if self.status == 1 then
      return "compiling " .. icons.text
    elseif self.status == 2 then
      return "done, standy " .. icons.checkmark
    elseif self.status == 3 then
      return "compilation error " .. icons.error
    end
    return ""
  end,
}
-- }}

-- pdf file size
-- {{
local PdfFileSize = {
  condition = function()
    return vim.g.heirline_pdfsize_show
  end,
  provider = function()
    local file = tostring(vim.fn.expand("%:p:r")) .. ".pdf"
    local result = vim.api.nvim_call_function("getfsize", { file })
    if result > 0 then
      return "size: " .. result .. " b"
      -- return tostring(vim.fn.expand("%:r")) .. ".pdf " .. "size: " .. result .. " bytes"
    else
      return "no " .. tostring(vim.fn.expand("%:r")) .. ".pdf found"
    end
  end,
  hl = { fg = colors.text_gray },
}
-- }}

-- ╔═══════════════════╗
-- ║ Winbar components ║
-- ╚═══════════════════╝

-- default winbar
-- {{
local WinBar = {
  fallthrough = false,
  { -- A special winbar for terminals
    condition = function()
      return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    utils.surround({ "", "" }, colors.default_gray, {
      FileType,
      Space,
      TerminalName,
    }),
  },
  { -- An inactive winbar for regular files
    condition = function()
      return not conditions.is_active()
    end,
    utils.surround({ "", "" }, colors.default_gray, { hl = { fg = "gray", force = true }, FileNameBlock }),
  },
  -- A winbar for regular files
  -- utils.surround({ "", "" }, colors.default_gray, FileNameBlock),
}
-- }}

-- Dropbar
-- {{
local Dropbar = {
  -- make it default true
  condition = function(self)
    -- check if there is any value here
    return vim.tbl_get(require("dropbar.utils").bar.get_current() or {}, "buf")
  end,
  static = { dropbar_on_click_string = "v:lua.dropbar.callbacks.buf%s.win%s.fn%s" },
  init = function(self)
    self.data = require("dropbar.utils").bar.get_current()
    local components = self.data.components
    local children = {}
    for i, c in ipairs(components) do
      local child = {
        {
          hl = c.icon_hl,
          provider = c.icon:gsub("%%", "%%%%"),
        },
        {
          hl = c.name_hl,
          provider = c.name:gsub("%%", "%%%%"),
        },
        on_click = {
          callback = self.dropbar_on_click_string:format(self.data.buf, self.data.win, i),
          name = "heirline_dropbar",
        },
      }
      if i < #components then
        local sep = self.data.separator
        table.insert(child, {
          provider = sep.icon,
          hl = sep.icon_hl,
          on_click = {
            callback = self.dropbar_on_click_string:format(self.data.buf, self.data.win, i + 1),
          },
        })
      end
      table.insert(children, child)
    end
    self.child = self:new(children, 1)
  end,
  provider = function(self)
    return self.child:eval()
  end,
}
-- }}

-- ╔════════════════════╗
-- ║ tabline components ║
-- ╚════════════════════╝

local TablineFileIcon = {
  init = function(self)
    local filename = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(self.tabpage)))
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color =
        require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local TabLineOffset = {
  condition = function(self)
    local win = vim.api.nvim_tabpage_list_wins(0)[1]
    local bufnr = vim.api.nvim_win_get_buf(win)
    self.winid = win

    if vim.bo[bufnr].filetype == "snacks_layout_box" then
      self.title = ""
      return true
      -- elseif vim.bo[bufnr].filetype == "TagBar" then
      --     ...
    end
  end,

  provider = function(self)
    local title = self.title
    local width = vim.api.nvim_win_get_width(self.winid)
    local pad = math.ceil((width - #title) / 2)
    return string.rep(" ", pad) .. title .. string.rep(" ", pad)
  end,

  hl = function(self)
    if vim.api.nvim_get_current_win() == self.winid then
      return "TablineSel"
    else
      return "Tabline"
    end
  end,
}

-- a nice "x" button to close the buffer
-- local TablineCloseButton = {
-- condition = function(self)
--   --
--   return not self.tabpage
-- end,
-- TODO: This closes the CURRENT tab, even if you are clicking "x" on a diff
-- button

-- provider = "%999X  %X",

-- provider = '%#TabLine#%999Xx',

-- hl = { fg = "gray" },
-- }

local TablineCloseButton = {
  provider = "%999X  %X",
  hl = function(self)
    if self.is_active then
      return { fg = colors.text_gray, bg = colors.light_gray }
    else
      return { fg = colors.text_unselected, bg = colors.default_gray }
    end
  end,
}

local Tab = utils.surround({ "", "" }, function(self)
  if self.is_active then
    return colors.light_gray
  else
    return colors.default_gray
  end
end, {
  TablineFileIcon,
  {
    provider = function(self)
      local projectName = ""
      local returnVal = ""
      local filename =
          vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(self.tabpage)))
      if filename == "" then
        returnVal = "[No Name]"
      else
        if vim.fn.finddir(".git/..", vim.fn.expand(filename) .. ";") ~= "" then
          -- there doesn't seem to be a split function in lua! This is the best I can do...
          for str in string.gmatch(vim.fn.finddir(".git/..", vim.fn.expand(filename) .. ";"), "([^/]+)") do
            projectName = str
          end
          returnVal = projectName
        else
          returnVal = vim.fn.fnamemodify(filename, ":t")
        end
      end

      return "%" .. self.tabnr .. "T " .. returnVal .. "  %T"
    end,
  },
  TablineCloseButton,
  hl = function(self)
    if self.is_active then
      return { fg = colors.text_gray, bg = colors.light_gray }
    else
      return { fg = colors.text_unselected, bg = colors.default_gray }
    end
  end,
})

local TabPages = {
  condition = function()
    return #vim.api.nvim_list_tabpages() >= 1
  end,
  TabLineOffset,
  utils.make_tablist(Tab),
  -- {
  --   provider = "%=",
  --   hl = { fg = colors.light_red },
  -- },
}

-- }}
-- ╔═════════════╗
-- ║ statuslines ║
-- ╚═════════════╝

-- default
-- {{

local CircleComponent = utils.surround(semiCircles, function()
  local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
  if mode == "i" then
    return colors.medium_blue
  end
  return colors.light_gray
end, {
  fallthrough = false,
  MacroRec,
  ReadOnlyFlag,
  ChangeFlag,
  {
    flexible = priority.high,
    { provider = " " },
    { provider = "" },
  },
})

local MainComponent = {
  hl = function(self)
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    if mode == "i" then
      return { bg = colors.default_blue }
    end
    return { bg = colors.default_gray }
  end,

  Space,
  Diagnostics,
  Space,
  FileNameBlock,
  -- SnacksProfiler,
  Align,
  PdfFileSize,
  Space,
  VimtexCompilerStatus,
  DAPMessages,
  LSPActive,
  Space,
  GitBlock,
}
local OilComponent = {
  hl = function(self)
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    if mode == "i" then
      return { bg = colors.default_blue }
    end
    return { bg = colors.default_gray }
  end,

  Space,
  OilBuffer,
  -- SnacksProfiler,
  Align,
  Space,
  LSPActive,
  Space,
  GitBlock,
}

local StatusComponent = {
  hl = function(self)
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    if mode == "i" then
      return { fg = colors.text_gray, bg = colors.default_blue }
    end
    return { fg = colors.text_gray, bg = colors.light_gray }
  end,
  Seperator,
  Lazy,
  FileSize,
  Percentage,
  Space,
}

local OilStatusLine = {
  condition = function()
    return vim.bo.filetype == "oil"
  end,
  hl = function(self)
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    if mode == "i" then
      return { bg = colors.default_blue }
    end
    return { bg = colors.default_gray }
  end,
  CircleComponent,
  { provider = " ", hl = { force = true } },
  ViMode,
  Jumpable,
  OilComponent,
  StatusComponent,
  Pos,
}
local DefaultStatusline = {
  hl = function(self)
    local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
    if mode == "i" then
      return { bg = colors.default_blue }
    end
    return { bg = colors.default_gray }
  end,
  CircleComponent,
  { provider = " ", hl = { force = true } },
  ViMode,
  Jumpable,
  MainComponent,
  StatusComponent,
  Pos,
}

-- }}

-- inactive
-- {{
local InactiveStatusline = {
  condition = conditions.is_not_active,
  FileName,
  Align,
}
-- }}

-- help file
-- {{
local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    })
  end,
  hl = { bg = colors.default_gray },
  HelpFileName,
  Align,
  FileType,
}
-- }}

-- terminal
-- {{
local TerminalStatusline = {

  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,

  -- hl = { bg = colors.dark_red },

  -- Quickly add a condition to the ViMode to only show it when buffer is active!
  { condition = conditions.is_active, ViMode },
  { provider = " ",                   hl = { bg = colors.default_gray } },
  TerminalName,
  { provider = "%=", hl = { bg = colors.default_gray } },
  FileType,
}
-- }}

-- ╔═══════╗
-- ║ Setup ║
-- ╚═══════╝

-- statuslines
-- {{

local AlphaStatusline = {
  condition = function()
    return vim.bo.filetype == "alpha"
  end,

  provider = "%=",
  hl = { fg = colors.text_gray, bg = gruvbox_bg },
}

local TelescopeStatusline = {
  condition = function()
    return vim.bo.filetype == "TelescopePrompt"
  end,
  provider = "it works!",
  -- ViMode,
}

local StatusLines = {
  -- the first statusline with no condition, or which condition returns true is used.
  -- think of it as a switch case with breaks to stop fallthrough.
  fallthrough = false,

  AlphaStatusline,
  TelescopeStatusline,
  SpecialStatusline,
  TerminalStatusline,
  InactiveStatusline,
  OilStatusLine,
  DefaultStatusline,
}
-- }}

-- winbars
-- {{
local Winbars = {
  fallthrough = false,
  -- WinBar,
  Dropbar,
}
-- }}

require("heirline").setup({
  statusline = StatusLines,
  -- Not adjusting these using heirline
  -- winbar = Winbars,
  tabline = TabPages,
  -- statuscolumn = {...},
})

-- toggle statusline components (under <c-w>s)
-- {{
vim.keymap.set("n", "<c-w>sg", function()
  vim.api.nvim_exec_autocmds("User", { pattern = "HeirlineGitToggle" })
end, { desc = "statusline git toggle" })

vim.keymap.set("n", "<c-w>sp", function()
  vim.api.nvim_exec_autocmds("User", { pattern = "HeirlinePdfSizeToggle" })
end, { desc = "statusline pdf-size toggle" })

vim.keymap.set("n", "<c-w>sl", function()
  vim.api.nvim_exec_autocmds("User", { pattern = "HeirlineLspToggle" })
end, { desc = "statusline toggle Lsp" })

--For project-relative pwd in statusline (used in lualine.lua)
--NOTE: use it rarely, so trying to use it to navigate proof environments, see
--lua/configs/treesitter.lua
-- vim.keymap.set("n", "[P", function()
--   vim.api.nvim_exec_autocmds("User", {
--     pattern = "HeirlineRelativeDirOn",
--   })
-- end, { desc = "PwdInStatusline" })
--
-- vim.keymap.set("n", "]P", function()
--   vim.api.nvim_exec_autocmds("User", {
--     pattern = "HeirlineRelativeDirOff",
--   })
-- end, { desc = "NoPwdInStatusline" })

--For pwd in statusline (used in lualine.lua)
vim.keymap.set("n", "<c-w>sP", function()
  if vim.g.heirline_directory_show == false then
    vim.api.nvim_exec_autocmds("User", {
      pattern = "HeirlineDirectoryOn",
    })
  else
    vim.api.nvim_exec_autocmds("User", {
      pattern = "HeirlineDirectoryOff",
    })
  end
end, { desc = "Pwd In Statusline" })


-- turn off non-PDF information, and turn on PDF information
vim.keymap.set("n", "<c-w>s<c-p>", function()
    vim.api.nvim_exec_autocmds("User", {
      pattern = "HeirlinePDFModeOn",
    })
end, { desc = "Pwd In Statusline" })

-- vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
