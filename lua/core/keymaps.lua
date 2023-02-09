local wk = require("which-key")

vim.g.mapleader = " "

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("c", "jk", "<Esc>", { noremap = true })

wk.register({
	a = {
		name = "Execute",
		f = { ":RunFile<CR>" , "Run file"},
		p = { ":RunProject<CR>", "Run project" },
	},
}, { prefix = "<leader>" })

