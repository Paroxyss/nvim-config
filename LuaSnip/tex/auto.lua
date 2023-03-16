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
		format = "\\sum_{<start>}^{<endi>} <corpus>",
		nodes = {
			start = i(1, "start"),
			endi = i(2, "end"),
			corpus = i(0, "corpus"),
		},
		condition = ctx.math
	}),
	createAutoSnippet({
		trig = "int",
		format = "\\int_{<start>}^{<endi>} <corpus>",
		nodes = {
			start = i(1, "start"),
			endi = i(2, "end"),
			corpus = i(0, "corpus"),
		},
		condition = ctx.math
	}),

	-- zone d'equation
	s({ trig = "$", snippetType = "autosnippet" },
		{
			c(1, {
				sn(nil, { t("$"), r(1, "expression"), t("$ ") }),
				sn(nil, { t({ "\\[ ", "    " }), r(1, "expression"), t({ "", "\\]", "" }) })
			})
		},
		{
			stored = {
				["expression"] = i(1, "expression")
			},
			condition = ctx.math -- l'utilisateur a entré un $, donc vimtex pense que c'est une zone de maths
		}
	),
	s({ trig = "\"", snippetType = "autosnippet" }, {
		t("\\text{"), i(1), t("}")
	}, { condition = ctx.math }),

	s({ trig = "__", snippetType = "autosnippet" }, {
		t("\\underline{"), i(1), t("}")
	}, { condition = function() return not ctx.math() end }),

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
	),

	-- __ et ^^ , rajouter des accolades
	s({ trig = "__", snippetType = "autosnippet", wordTrig = false }, {
		t("_{"), i(1), t("}"), i(0)
	}, { condition = ctx.math }),
	s({ trig = "^^", snippetType = "autosnippet", wordTrig = false }, {
		t("^{"), i(1), t("}"), i(0)
	}, { condition = ctx.math }),
}
