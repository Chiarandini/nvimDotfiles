---@diagnostic disable: undefined-global, unused-local
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local helper = require("utils.luasnip-helper-func")
local get_visual = helper.get_visual_node
local get_visual_insert = helper.get_visual_insert_node
local tex_utils = helper.tex_utils

return
{

},
{
	s({trig = 'HRR', snippetType = 'autosnippet', name='Hirzebruch Riemann Roch'},
		{
			t({ [[Hirzebruch Riemann Roch]] })
		}
	),
	s({trig = 'GRR', snippetType = 'autosnippet', name='Grothendieck Riemann Roch'},
		{
			t({ [[Grothendieck Riemann Roch]] })
		}
	),
	-- s({trig = 'LFH', snippetType = 'autosnippet', name='let the following homotopy'},
	-- 	{
	-- 		t({ [[Let $f_t: D^2 \to M^3$ be an immersed homotopy to a simply connected smooth $3$-manifold $M^3$ where $f_0$ and $f_1$ are embeddings.]] })
	-- 	}
	-- )
}
