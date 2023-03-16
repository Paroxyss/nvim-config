require('core.keymaps')
require('core.plugins')
require('core.settings')
require('core.options')

vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1
vim.cmd 'colorscheme sonokai'

-- Vimtex config (à bouger)
vim.g.vimtex_view_method = 'zathura'
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd("VimLeavePre", {
	pattern = "*.tex",
	command = "VimtexClean"
})

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local firstLine = vim.api.nvim_buf_get_lines(0, 0, 1, false);
		if (string.match(firstLine[1], "TOFCUT")) then
			vim.cmd("silent !fcut " .. vim.api.nvim_buf_get_name(0))
		end
	end
})
