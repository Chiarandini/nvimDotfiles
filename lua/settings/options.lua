-- opt is _global_ options. vim.bo is buffer, vim.wo windows scope, etc.

--  ╔══════════════════════════════════════════════════════════╗
--  ║           Type ':options' to see all settings            ║
--  ╚══════════════════════════════════════════════════════════╝

-- to make it more legible
local opt = vim.o
local g = vim.g
-- local fn = vim.fn

--set global leader
g.mapleader = '\\'
-- set local leader
g.maplocalleader = ','
-- absolute numbers on side
opt.number = true
-- relative numbers on side
opt.relativenumber = true
-- mouse works in every type of mode and buffer
opt.mouse = "a"
-- add mouse hover
opt.mousemoveevent=true
-- auto save when switching buffers
opt.autowrite = true
-- default textwidth before wrapping
opt.textwidth=90
-- sync buffers automatically
vim.opt.autoread = true
-- disable neovim generating a swapfile and showing the error
vim.opt.swapfile = false
-- when breaking line, keeps amount of spaces (good for latex). Only fault is sometimes adds extra space
opt.breakindent = true
-- for nicer visual warpping
opt.linebreak = true
-- options for breakindent
vim.opt.breakindentopt = 'sbr,min:0,shift:1'  -- Adjust 'shift' to control the indentation width
-- Add a virtual text at the end of the line to indicate that the line is broken
vim.opt.showbreak = '↳'
-- have a global statusline
-- vim.o.laststatus=3
-- want diffthis to go to the right
vim.o.diffopt = vim.o.diffopt .. ",vertical"
-- want good formatting of comments
opt.formatoptions = "tq1jn"
-- when searching, case is ignored
opt.ignorecase  = true
-- try to detect when case is different than what you are typing
opt.infercase = true
-- start incrementally looking for the word while typing
opt.incsearch = true
-- case sensitive if capital letter are present
opt.smartcase  = true
-- by default, no highlight serach (turn on with [oh or [n)
opt.hlsearch = false
-- a tab is the length of 4 spaces
opt.tabstop=4
-- if set to true, when tab is pressed, it will insert spaces (useful for some filetypes)
opt.smarttab = false
-- shift (i.e. for > <, or cinent) to 4 spaces by default (diff ftplugins got other values)
opt.shiftwidth=4
-- to Truncate long Ex commands
opt.shortmess = opt.shortmess .. "T"
-- preffer to split bellow than above
opt.splitbelow = true
-- preffer to split to right instead of to left
opt.splitright = true -- default split to right
-- Don't want searches to look here
-- BEWARE OF HOW IT CHANGES EXPAND https://stackoverflow.com/questions/24609451/vim-function-expand-always-return-empty-string
opt.wildignore=opt.wildignore .. "*/.git/*,*.swp"
-- opt.wildignore=opt.wildignore .. "*/.git/*,*/tmp/*,*.swp"
-- Automatically make newline when text goes beyond textwidth.
opt.wrap = true
--remember many more old files
opt.shada = "'1000,<50,s10,h"
--default saved in case you change: opt.shada='1000,<50,s10,h

-- don't scroll too far off the end of the line
opt.scrolloff = 4
-- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
opt.sidescrolloff = 36
-- to make side window look prettier
vim.cmd('set fillchars=fold:\\ ')
-- when switching buffers,
opt.autochdir = true
-- when no sound, give visual warning
opt.visualbell = true
-- to speed up load-time
vim.loader.enable()
-- scroll smoothly with mosue
vim.opt.smoothscroll = true
-- set spelling language (setlocal spell done in settings/autocmd.lua)
vim.opt.spelllang = { 'en_us' }
-- for spell-checking in Cased word
-- vim.opt.spelloptions = 'Cased'

-- Fixes (old) bug on empty latex files
vim.tex_flavor= "latex"

-- set default directory
--vim.cmd("cd ~/oneDrive/Documents/")

-- Enable persistent undo so that undo history persists across vim session (undo dir in
-- directories.lua)
opt.undofile = true
opt.undolevels=1000
opt.undoreload=10000
-- for better session restoration
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- old option that insures terminals have gui colours enabled
opt.termguicolors = true
-- do not show fold-level on the size
opt.foldcolumn = '0'
-- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevel = 99
-- don't start with folds
opt.foldlevelstart = -1
-- enable folding by default
opt.foldenable = true
-- autosave
-- TODO: may not want to have this, experimental
opt.autowriteall = true
-- Set cmdheight to zero
-- ISSUE: is buggy
-- opt.cmdheight = 0

-- default want to conceal as much as possible
vim.o.conceallevel = 2
-- for latex, what to conceal
vim.gtex_conceal = "abdgm"
-- make sure to still see command when cmdheight=0
-- opt.showcmdloc = 'statusline'
-- set the number of lines to scroll for <C-U> and <C-D>
opt.scroll = 16 -- default 12

-- opt.backup = true
-- opt.backupdir = fn.stdpath('data') .. '/backup//'

-- NOTE: Done in Lazy
-- disable plugins shipped with neovim
-- vim.g.loaded_gzip            = 0
-- vim.g.loaded_tar             = 0
-- vim.g.loaded_tarPlugin       = 0
-- vim.g.loaded_zip             = 0
-- vim.g.loaded_zipPlugin       = 0
-- vim.g.loaded_getscript       = 0
-- vim.g.loaded_getscriptPlugin = 0
-- vim.g.loaded_vimball         = 0
-- vim.g.loaded_vimballPlugin   = 0
-- vim.g.loaded_matchit         = 0
-- vim.g.loaded_2html_plugin    = 0
-- vim.g.loaded_logiPat         = 0
-- vim.g.loaded_rrhelper        = 0
-- vim.g.loaded_netrw           = 0
-- vim.g.loaded_netrwPlugin     = 0
