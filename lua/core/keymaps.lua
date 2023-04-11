local wk = require("which-key")

vim.g.mapleader = " "

wk.register({
	a = {
		name = "Execute",
		f = { ":RunFile<CR>" , "Run file"},
		p = { ":RunProject<CR>", "Run project" },
	},
	["nd"] = {require("notify").dismiss, "DismissNotifications"}
}, { prefix = "<leader>" })

