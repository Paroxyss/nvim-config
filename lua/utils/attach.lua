local wk = require("which-key")
return function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.print("attached a lsp")
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	require "lsp_signature".on_attach({}, bufnr)

	wk.register({
		["<leader>"] = {
			w = {
				name = "workspace",
				a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
				r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
				l = { function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "List workspace folders" },
			},
			D = { vim.lsp.buf.type_definition, "Type definition" },
			r = {
				name = "refactor",
				n = { vim.lsp.buf.rename, "Rename" },
				a = { vim.lsp.buf.code_action, "Code action" },
			},
			F = { function()
				vim.lsp.buf.format {
					async = true
				}
			end, "Format" },
		},
		g = {
			D = { vim.lsp.buf.declaration, "Declaration" },
			d = { vim.lsp.buf.definition, "Definition" },
			i = { vim.lsp.buf.implementation, "Implementation" },
			["<C-k>"] = { vim.lsp.buf.signature_help, "Signature help" },
		},
		K = { vim.lsp.buf.hover, "Hover" },
	}, {
		mode = "n",
		buffer = bufnr,
	})
end
