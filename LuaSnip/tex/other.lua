local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmta = require("luasnip.extras.fmt").fmta

local ctx = require("utils.latexContexts").ctx

local rec_equation
rec_equation = function()
	return sn(
		nil,
		c(1, {
			-- Order is important, sn(...) first would cause infinite loop of expansion.
			t(""),
			sn(nil, { t({ "\\\\", "\t & = " }), i(1), t(" "), d(2, rec_equation, {}) }),
		})
	)
end

local function rec_ls()
	return sn(
		nil,
		c(1, {
			-- Order is important, sn(...) first would cause infinite loop of expansion.
			t(""),
			sn(nil, { t({ "", "\t\\bi " }), i(1), d(2, rec_ls, {}) }),
		})
	)
end
local function genDyn()
    return d()
end

return {
	s("alignedequation", fmta([[
\begin{equation*} \label{eq1}
\begin{split}
    <val> & = <expr> <rec>
\end{split}
\end{equation*} 
    ]], {
		val = i(1),
		expr = i(2),
		rec = d(3, rec_equation, {}),
	}
	)),
	s("list", {
		t({ "\\begin{itemize}", "\t\\bi " }),
		i(1),
		d(2, rec_ls, {}),
		t({ "", "\\end{itemize}" }),
	}),
	s("ll", {
		t({ "\\begin{itemize}", "\t\\bi " }),
		i(1),
		d(2, rec_ls, {}),
		t({ "", "\\end{itemize}" }),
	}),
	s("fdef",
		{
			c(1, {
				fmta("\\funcdefExpr{<n>}{<v>}{<ex>}",
					{
						n = r(1, "name"),
						v = r(2, "variable"),
						ex = r(3, "expression")
					}
				),
				fmta("\\funcdefEns{<n>}{<s>}{<e>}",
					{
						n = r(1, "name"),
						s = r(2, "ensStart"),
						e = r(3, "ensEnd")
					}
				),
				fmta("\\funcdefFull{<n>}{<s>}{<e>}{<v>}{<ex>}",
					{
						n = r(1, "name"),
						s = r(2, "ensStart"),
						e = r(3, "ensEnd"),
						v = r(4, "variable"),
						ex = r(5, "expression")
					}
				),
			})
		},
		{
			stored = {
				["name"] = i(1, "f"),
				["ensStart"] = i(1, "depart"),
				["ensEnd"] = i(1, "fin"),
				["variable"] = i(1, "x"),
				["expression"] = i(1, "exp"),
			},
			condition = ctx.math
		}
	),
}
