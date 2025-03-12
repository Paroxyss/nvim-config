local wk = require("which-key")
return function(_, bufnr)
	-- vim.print("attached a lsp")
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	require "lsp_signature".on_attach({}, bufnr)

	wk.add({
		{ "<leader>w",  buffer = bufnr,                                                          group = "workspace" },
		{ "<leader>wa", vim.lsp.buf.add_workspace_folder,                                        desc = "Add workspace folder",    buffer = bufnr },
		{ "<leader>wr", vim.lsp.buf.remove_workspace_folder,                                     desc = "Remove workspace folder", buffer = bufnr },
		{ "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "List workspace folders",  buffer = bufnr },

		{ "<leader>D", vim.lsp.buf.type_definition, desc = "Type definition", buffer = bufnr },

		{ "<leader>r",  buffer = bufnr,          group = "refactor" },
		{ "<leader>rn", vim.lsp.buf.rename,      desc = "Rename",      buffer = bufnr },
		{ "<leader>ra", vim.lsp.buf.code_action, desc = "Code action", buffer = bufnr },

		{ "<leader>F", function() vim.lsp.buf.format { async = true } end, desc = "Format", buffer = bufnr },

		{ "gD", vim.lsp.buf.declaration,    desc = "Declaration",    buffer = bufnr },
		{ "gd", vim.lsp.buf.definition,     desc = "Definition",     buffer = bufnr },
		{ "gi", vim.lsp.buf.implementation, desc = "Implementation", buffer = bufnr },

		{ "K", vim.lsp.buf.hover, desc = "Hover", buffer = bufnr },
	})
end
