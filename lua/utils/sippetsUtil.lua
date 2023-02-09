local ls = require("luasnip")
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
    createAutoSnippet = function(config)
        return s(
            {
                trig = config["trig"],
                snippetType = "autosnippet"
            },
            fmta(config["format"], config["nodes"]),
            {
                condition = config["condition"]
            }
        )
    end
}
