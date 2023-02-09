function load()
	local builtin = require('telescope.builtin')
	local wr = require('which-key')

	require("telescope").setup {
		defaults = { file_ignore_patterns = { "node_modules" } }
	}
	wr.register({
		f = {
			name = "file",
			f = { builtin.find_files, "Find files" },
			g = { builtin.live_grep, "Live grep" },
			b = { builtin.buffers, "Buffers" },
			h = { builtin.help_tags, "Help tags" },
			k = { builtin.keymaps, "Keymaps" },
		},
	}, { prefix = "<leader>" })
end

vim.defer_fn(load, 200)
