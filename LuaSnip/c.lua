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

return {
	s("fori", fmta([[
for(int <iter> = <initial>; <iter> << <final>; <iter>++){
    <corpus>
}
    ]], {
		iter = i(1, "i"),
		initial = i(2, "0"),
		final = i(3, "0"),
		corpus = i(4)
	}))
}
