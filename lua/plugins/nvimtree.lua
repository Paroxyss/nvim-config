vim.defer_fn(function()
	local nt = require("nvim-tree")
	local wk = require("which-key")
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	vim.opt.termguicolors = true

	-- setup
	nt.setup({
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})

	-- keybindings
	wk.add({
		{ "<leader>e", group = "Explorer" },
		{ "<leader>eo", ":NvimTreeOpen<CR>", desc = "Open tree" },
		{ "<leader>et", ":NvimTreeToggle<CR>", desc = "Toggle tree" },
	})

	-- nvim-tree is also there in modified buffers so this function filter it out
	local modifiedBufs = function(bufs)
		local t = 0
		for _, v in pairs(bufs) do
			if v.name:match("NvimTree_") == nil then
				t = t + 1
			end
		end
		return t
	end

	vim.api.nvim_create_autocmd("BufEnter", {
		nested = true,
		callback = function()
			if #vim.api.nvim_list_wins() == 1 and
			    vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
			    modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
				vim.cmd "quit"
			end
		end
	})
end, 200)
