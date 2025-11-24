-- auto reload kitten config on save
vim.api.nvim_create_autocmd('BufWritePost', {
	desc = 'auto reload kitten config on save',

	callback = function (opts)
		if vim.bo[opts.buf].filetype == 'kitty' then
			vim.fn.jobstart("kill -SIGUSR1 $KITTY_PID")
		end
	end,
})

