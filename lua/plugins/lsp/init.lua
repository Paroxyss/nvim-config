local wk = require("which-key")

wk.register({
	["<leader>"] = {
		e = { vim.diagnostic.open_float, "Show diagnostics" },
		j = { vim.diagnostic.goto_next, "Next diagnostic" },
		k = { vim.diagnostic.goto_prev, "Previous diagnostic" },
		q = { vim.diagnostic.setloclist, "Set location list" },
	},
}, {
	mode = "n",
})
