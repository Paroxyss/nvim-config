local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta

local ctx = require("utils.latexContexts").ctx
local getCustomEnv = require("utils.latexContexts").getCustomEnv
local createAutoSnippet = require("utils.sippetsUtil").createAutoSnippet

return {
	createAutoSnippet({
		trig = "fra",
		format = "\\frac{<num>}{<denum>}",
		nodes = {
			num = i(1, "num"),
			denum = i(2, "denum"),
		},
		condition = ctx.math
	}),
	createAutoSnippet({
		trig = "prod",
		format = "\\prod_{<start>}^{<endi>} <corpus>",
		nodes = {
			start = i(1, "start"),
			endi = i(2, "end"),
			corpus = i(0, "corpus"),
		},
		condition = ctx.math
	}),
	createAutoSnippet({
		trig = "sum",
		format = "\\sum{<start>}^{<endi>} <corpus>",
		nodes = {
			start = i(1, "start"),
			endi = i(2, "end"),
			corpus = i(0, "corpus"),
		},
		condition = ctx.math
	}),
	createAutoSnippet({
		trig = "int",
		format = "\\int{<start>}^{<endi>} <corpus>",
		nodes = {
			start = i(1, "start"),
			endi = i(2, "end"),
			corpus = i(0, "corpus"),
		},
		condition = ctx.math
	}),


	--greek letters
	s({ trig = ";;a", snippetType = "autosnippet" },
		{
			t("\\alpha"),
		}
	),
	s({ trig = ";;b", snippetType = "autosnippet" },
		{
			t("\\beta"),
		}
	),
	s({ trig = ";;g", snippetType = "autosnippet" },
		{
			t("\\gamma"),
		}
	),

	-- zone d'equation
	s({ trig = "$", snippetType = "autosnippet" },
		{
			c(1, {
				sn(nil, { t("$ "), r(1, "expression"), t(" $ ") }),
				sn(nil, { t({ "\\[ ", "    " }), r(1, "expression"), t({ "", "\\]", "" }) })
			})
		},
		{
			stored = {
				["expression"] = i(1, "expression")

			}
		}
	),
	-- envs perso
	s({ trig = "bg(%w+)", snippetType = "autosnippet", regTrig = true },
		fmta([[
			\begin{<type>}[<title>]
			    <content>
			\end{<type>}
			<out>
		        ]],
			{
				type = f(function(_, snip)
					return getCustomEnv(snip.captures[1])
				end, {}),
				title = i(1),
				content = i(2),
				out = i(0),
			})
		,
		{
			condition = function(_, _, captures)
				return getCustomEnv(captures[1])
			end
		}
	)

	-- opérateurs et quantificateurs
}
