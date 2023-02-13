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

local simpleReplace = {
	[";a"] = "\\alpha",
	[";b"] = "\\beta",
	[";g"] = "\\gamma",
	[";e"] = "\\epsilon",
	[";t"] = "\\tau",
	["<"] = "<",
	[">"] = ">",
	["="] = "="
}

local onlyInMath = {
	["fa"] = "\\forall",
	["ex"] = "\\exists",
	["in"] = "\\in",
	["\\inc"] = "\\subset",
	["imp"] = "\\implies",
	["equ"] = "\\equiv",
	["leq"] = "\\leq",
	["geq"] = "\\geq",
}

local matchCompleted = {
	["ens(.)"] = "\\mathbb",
	["cal(.)"] = "\\mathcal"
}

local function dynamicMath(_, _, _, replaceText)
	if not ctx.math() then
		return sn(1, {
			t("$"), t(replaceText), t("$")
		})
	end
	return sn(1, {
		t(replaceText)
	})
end

local snippets = {}

for k, v in pairs(simpleReplace) do
	table.insert(snippets,
		s({ trig = k, snippetType = "autosnippet" },
			{
				d(1, dynamicMath, {}, { user_args = { v } })
			}
		)
	)
end

for k, v in pairs(onlyInMath) do
	table.insert(snippets,
		s({ trig = k, snippetType = "autosnippet" },
			{
				t(v)
			}, {
			condition = ctx.math
		})
	)
end

for k, v in pairs(matchCompleted) do
	local u = function()
		return f(function(_, snip)
			return (v .. "{" .. string.upper(snip.captures[1]) .. "}")
		end, {})
	end
	table.insert(snippets,
		s({ trig = k, snippetType = "autosnippet", regTrig = true },
			{
				u()
			}, {
			condition = ctx.math
		})
	)
	table.insert(snippets,
		s({ trig = k, regTrig = true },
			{
				t("$"), u(), t("$")
			}, {
			condition = function()
				return not ctx.math()
			end
		})
	)
end
return snippets
