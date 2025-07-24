--  ╔══════════════════════════════════════════════════════════╗
--  ║              Important Directories Shortcut              ║
--  ╚══════════════════════════════════════════════════════════╝
--{{
---@deprecated This is no longer needed! <space>ff would let you jump to your favourite directory
-- vim.cmd([[command! DOC cd ~//Documents/]])
-- vim.cmd([[command! PIC cd ~//Pictures/]])
-- vim.cmd([[command! BOOKS cd ~//Documents/Books/]])
-- vim.cmd([[command! MATH cd ~//Documents/Books/Mathematics/]])
-- vim.cmd([[command! U cd ~//Documents/University/master's/]])
-- vim.cmd([[command! CONFIG cd ~/.config/nvim]])

-- with one exception, I use this often
vim.cmd([[command! J cd ~//Documents/junk/]])
vim.cmd([[command! W cd ~//Documents/NateObsidianVault/]])
--}}
--  ╔══════════════════════════════════════════════════════════╗
--  ║               Important Setup Directories                ║
--  ╚══════════════════════════════════════════════════════════╝
--{{

vim.g.HOME = os.getenv("HOME")
-- set location of python3
-- vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
--add spellfile for words not in dictionary
vim.o.spellfile = vim.g.HOME .. "/.config/nvim/spell/en.utf-8.add"


vim.o.undodir= vim.g.HOME .. "/.cache/nvim/undo"
-- add location to runtimepath
-- vim.o.runtimepath = vim.o.runtimepath .. HOME .. "/.config/nvim"
--swap file configuation
vim.o.dir = vim.g.HOME .. "/.cache/nvim/swap"
--}}
