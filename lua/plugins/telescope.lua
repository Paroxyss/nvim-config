local builtin = require('telescope.builtin')
local wr = require('which-key')
local actions = require('telescope.actions')

require("telescope").setup {
	defaults = {
		file_ignore_patterns = { "node_modules" },
		mappings = {
			i = {
				["<c-k>"] = actions.move_selection_previous,
				["<c-j>"] = actions.move_selection_next,
				["<c-d>"] = actions.delete_buffer,
				["<c-s>"] = actions.file_split
			},
			n = {
				["<Esc>"] = actions.close
			}
		}
	}
}
wr.register({
	f = {
		name = "file",
		f = { builtin.find_files, "Find files" },
		g = { builtin.live_grep, "Live grep" },
		b = { builtin.buffers, "Buffers" },
		h = { builtin.help_tags, "Help tags" },
		k = { builtin.keymaps, "Keymaps" },
		r = { builtin.registers, "Keymaps" },
		l = {
			name = "lsp",
			r = {builtin.lsp_references, "lsp_references"},
			c = {builtin.lsp_incoming_calls, "lsp_incoming_calls"},
			o = {builtin.lsp_outgoing_calls, "lsp_outgoing_calls"},
			d = {builtin.lsp_definitions, "lsp_definitions"},
			t = {builtin.lsp_type_definitions, "lsp_type_definitions"},
			i = {builtin.lsp_implementations, "lsp_implementations"},
			D = {builtin.lsp_document_symbols, "lsp_document_symbols"},
			w = {builtin.lsp_workspace_symbols, "lsp_workspace_symbols"},
			W = {builtin.lsp_dynamic_workspace_symbols, "lsp_dynamic_workspace_symbols"},
		},
	},
}, { prefix = "<leader>" })
