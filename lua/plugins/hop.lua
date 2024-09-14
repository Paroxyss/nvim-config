local hop = require('hop')
local directions = require('hop.hint').HintDirection
local wk = require("which-key")

hop.setup {}

wk.register({
	["<leader>"] = {
		u = { function()
			hop.hint_char2({ direction = directions.AFTER_CURSOR })
		end, "Hop forward" },
		i = { function()
			hop.hint_char2({ direction = directions.BEFORE_CURSOR })
		end, "Hop backward" },
	},
})
