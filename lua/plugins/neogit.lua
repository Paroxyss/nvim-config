local neogit = require('neogit')
local wk = require('which-key')

neogit.setup {}


wk.register({
	["<leader>g"] = { function() neogit.open("commit") end, "Git popup" }
})
