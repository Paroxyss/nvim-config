-- configuration du theme avant tout
vim.g.sonokai_style = 'default'
vim.g.sonokai_better_performance = 1

local black_theme = true;

if black_theme then
	vim.cmd 'colorscheme sonokai'
else
	vim.cmd 'set background=light'
	vim.cmd 'colorscheme PaperColor'
end
