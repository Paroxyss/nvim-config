local options = {
	showcmd = false,
	--lazyredraw = true,
	synmaxcol = 2048,
	shiftwidth = 4,
	ignorecase = true,
	smartcase = true,
	splitright = true,
	splitbelow = true,
	timeout = true,
	timeoutlen = 500,
	scrolloff = 8,
	cmdheight = 1,
	undofile = true,
	undolevels = 5000,
	writebackup = false,
	swapfile = false,
	--fileformat = "unix",
	encoding = "utf-8",
	--showtabline = 2,
	laststatus = 3,
	termguicolors = true,
	--cursorline = true,
	--cursorlineopt = "number",
	tabstop=4,
	wrap=false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
