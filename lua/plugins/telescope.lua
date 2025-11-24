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

wr.add({
    { "<leader>f", group = "file" },
		{ "<leader>fb", builtin.buffers,    desc = "Buffers" },
		{ "<leader>ff", builtin.find_files, desc = "Find files" },
		{ "<leader>fg", builtin.live_grep,  desc = "Live grep" },
		{ "<leader>fh", builtin.help_tags,  desc = "Help tags" },
		{ "<leader>fk", builtin.keymaps,    desc = "Keymaps" },
		{ "<leader>fr", builtin.registers,  desc = "Registers" },

		{ "<leader>fl", group = "lsp" },
		{ "<leader>flD", builtin.lsp_document_symbols,          desc = "lsp_document_symbols" },
		{ "<leader>flW", builtin.lsp_dynamic_workspace_symbols, desc = "lsp_dynamic_workspace_symbols" },
		{ "<leader>flc", builtin.lsp_incoming_calls,            desc = "lsp_incoming_calls" },
		{ "<leader>fld", builtin.lsp_definitions,               desc = "lsp_definitions" },
		{ "<leader>fli", builtin.lsp_implementations,           desc = "lsp_implementations" },
		{ "<leader>flo", builtin.lsp_outgoing_calls,            desc = "lsp_outgoing_calls" },
		{ "<leader>flr", builtin.lsp_references,                desc = "lsp_references" },
		{ "<leader>flt", builtin.lsp_type_definitions,          desc = "lsp_type_definitions" },
		{ "<leader>flw", builtin.lsp_workspace_symbols,         desc = "lsp_workspace_symbols" },
})
--[[
--
--]] --
