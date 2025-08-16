--  ╔══════════════════════════════════════════════════════════╗
--  ║                       latex setup                        ║
--  ╚══════════════════════════════════════════════════════════╝
return{

 {
	"lervag/vimtex",
	--NOTE: lazy = false is set so that I can inverse search! Need this to be loaded the
	--moment vim opens so that I can acess InverseSearch in headless mode.
	lazy = false,
	-- ft = { "tex" },
	config = function()
		require('configs.vimtex')
	end
},

{
	"latexTypos.nvim",
	ft = {"tex"},
	dev = true,
	config = function()
		require('latexTypos').setup()
	end,

},

{ -- drag-and-drop images into latex!!
	"HakonHarnes/img-clip.nvim",
	ft = {"tex", "markdown"},
	 keys = {
    { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
  config = function()
	  require('configs.img-clip')
  end
},

-- WARN: does not work atm.
-- {
-- 	--for tag navigation
-- 	"ludovicchabant/vim-gutentags",
-- 	ft = "tex",
-- 	config = function()
-- 		table.insert(vim.g.gutentags_project_root, ".tag_this")
-- 	end
-- }


--for code actions in latex
-- { 'barreiroleo/ltex_extra.nvim',
-- 	ft = { 'tex' },
-- 	dependencies = 'lervag/vimtex',
-- 	--config and opts in lsp.lua
-- }

-- NOTE: No longer needed, vimtex deals with it automatically
-- {
--nicer hiding in vim
-- 	'KeitaNakamura/tex-conceal.vim',
-- 	ft=  {'tex'},
-- 	dependencies = 'lervag/vimtex',
-- 	config = function()
-- 		require('configs.tex-conceal')
-- 	end
-- },
}
