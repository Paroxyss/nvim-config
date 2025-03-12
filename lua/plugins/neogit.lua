local neogit = require('neogit')
local wk = require('which-key')

neogit.setup {}

wk.add({
	{"<leader>g", function() neogit.open() end, desc = "Git popup" }
})
