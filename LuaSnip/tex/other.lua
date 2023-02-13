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

local function rec_ls ()
	return sn(
		nil,
		c(1, {
			-- Order is important, sn(...) first would cause infinite loop of expansion.
			t(""),
			sn(nil, { t({ "", "\t\\bi " }), i(1), d(2, rec_ls, {}) }),
		})
	)
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
}
