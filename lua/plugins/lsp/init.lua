local wk = require("which-key")

wk.add({
	{"<leader>e", vim.diagnostic.open_float, desc = "Show diagnostics" , mode = 'n'},
	{"<leader>j", vim.diagnostic.goto_next,  desc = "Next diagnostic" },
	{"<leader>k", vim.diagnostic.goto_prev,  desc = "Previous diagnostic" },
	{"<leader>q", vim.diagnostic.setloclist, desc = "Set location list" },
})
