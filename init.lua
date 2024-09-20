require('core.plugins')
require('core.keymaps')
require('core.settings')
require('core.options')

vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1

vim.g.instant_username = "william"

local black_theme = true;

if black_theme then
	vim.cmd 'colorscheme sonokai'
else
	vim.cmd 'set background=light'
	vim.cmd 'colorscheme PaperColor'
end

-- Vimtex config (à bouger)
vim.g.vimtex_view_method = 'sioyek'
vim.g.maplocalleader = ' '
