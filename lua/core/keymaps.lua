local wk = require("which-key")

vim.g.mapleader = " "

local themeActuel = false
local function setTheme(light)
	local iterm = require("iterm")
	if light then
		themeActuel = true
		vim.cmd 'set background=light'
		vim.cmd 'colorscheme PaperColor'
		vim.cmd 'TransparentEnable'
		iterm.set_profile("WhiteTheme")
	else
		themeActuel = false
		vim.cmd 'colorscheme sonokai'
		vim.cmd 'TransparentDisable'
		iterm.set_profile("Monokai")
	end
end

wk.register({
	["nd"] = { require("notify").dismiss, "DismissNotifications" },
	t = {
		name = "Theme",
		l = { function() setTheme(true) end, "Clair" },
		s = { function() setTheme(false) end, "Sombre" },
		t = { function() setTheme(not themeActuel) end, "Inverser" },
		b = {":TransparentToggle<CR>", "Inverser la transparence"}
	},
	m = {":w<CR>:!tsc<CR>","save and tsc"}
}, { prefix = "<leader>" })


wk.register({
	-- aller au début ou à la fin des accolades dans lesquelles on est
	["<c-h>"] = { "[{", "Accolade précédente" },
	["<c-l>"] = { "]}", "Accolade suivante" },
}, { mode = { "n", "v" } })
