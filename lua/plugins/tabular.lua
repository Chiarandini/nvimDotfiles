-- in visualmode, type T to align on a character
return{ 'godlygeek/tabular',
	keys =
	{
		{"T",   ":Tabularize /", mode = {"v"}, desc = 'align text on character'}
	}
	-- config = function ()
	-- 	vim.keymap.set("v", "T",)
	-- end
}
