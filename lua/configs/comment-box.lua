local keymap = vim.keymap.set

-- left aligned fixed size box with left aligned text
keymap({"n", "v"}, "<Leader>bb", "<cmd>CBalbox7<cr>")
-- centered adapted box with centered text

-- centered line
keymap("n", "<Leader>bl", "<cmd>CBcline<cr>")
