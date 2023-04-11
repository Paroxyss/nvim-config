require('core.keymaps')
require('core.plugins')
require('core.settings')
require('core.options')

vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1

vim.g.instant_username = "william"

vim.cmd 'colorscheme sonokai'
--vim.cmd 'set background=light'
--vim.cmd 'colorscheme PaperColor'

-- Vimtex config (à bouger)
vim.g.vimtex_view_method = 'sioyek'
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local firstLine = vim.api.nvim_buf_get_lines(0, 0, 1, false);
		if (string.match(firstLine[1], "TOFCUT")) then
			vim.cmd("silent !fcut " .. vim.api.nvim_buf_get_name(0))
		end
	end
})

-- Desactivation des plugins par défaut dans une quête désespérée des performances
-- (Actuellement 250 ms de chargement, une éternité pour cyprien)
local plug_builtins = {
	"gzip", "zip", "tar",
	"zipPlugin", "tarPlugin",
	"getscript", "getscriptPlugin",
	"vimball", "vimballPlugin",
	"2html_plugin", "matchit",
	"matchparen", "logiPat", "spellfile_plugin",
	"rrhelper", "remote_plugins",
	"man", "shada_plugin", "syntax_completion",
	"tutor_mode_plugin", "sql_completion"
}

if vim.fn.isdirectory(vim.fn.argv()[1]) == 0 then
	plug_builtins = vim.tbl_extend("force", plug_builtins,
		{ "netrw", "netrwPlugin", "netrwSettings" }
	)
end

for _, p in pairs(plug_builtins) do
	vim.g["loaded_" .. p] = 1
end
