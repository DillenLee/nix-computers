--- latex snippets

local ls = require("luasnip")
local s = ls.snippet 
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta


return {

	s({trig="beg",
		 dscr="create a 'begin' environment"},  
			fmta(
				[[
				\begin{<>}
					<>
				\end{<>}
				]] ,
			{
				i(1), i(0), rep(1)
			})
	),
	s("fig", fmt(
		[[
		\begin{{figure}}
			\centering
			\includegraphics[{}]{{{}}}
			\caption{{{}}}\label{{fig:{}}}
		\end{{figure}}
		]] ,
		{
			i(2), i(1), i(3), i(4),
		})
	),
	s("align", fmt(
		[[
		\begin{{align}}
			{} &= {}
		\end{{align}}
		]] ,
		{
			i(1), i(2)
		})
	),
	s({trig="mk",
		 dscr="automatically generate an inline math environment",
	 	 snippetType="autosnippet"},  
			fmta(
				"$<>$",
			{
				i(1)
			})
	),
	s({trig="_",
		 dscr="automatically underlines",
	 	 snippetType="autosnippet"},  
			fmta(
				"_{<>}",
			{
				i(1)
			})
	),
	s({trig="rd",
		 dscr="automatically exponentiates",
	 	 snippetType="autosnippet"},  
			fmta(
				"^{<>}",
			{
				i(1)
			})
	),
	s({trig="it",
		 dscr="italicies"},  
			fmta(
				"\\textit{<>}",
			{
				i(1)
			})
	),
}
