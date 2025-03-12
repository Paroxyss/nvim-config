local wk = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = ' '

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

wk.add({
    { "<leader>m", ":w<CR>:!tsc<CR>", desc = "save and tsc" },
    { "<leader>nd", require("notify").dismiss, desc = "DismissNotifications" },
    { "<leader>t", group = "Theme" },
    { "<leader>tb", ":TransparentToggle<CR>", desc = "Inverser la transparence" },
    { "<leader>tf", function() require("iterm").fireworks() end, desc = "Fireworks" },
    { "<leader>tl", function() setTheme(true) end, desc = "Clair" },
    { "<leader>ts", function() setTheme(false) end, desc = "Sombre" },
    { "<leader>tt", function() setTheme(not themeActuel) end, desc = "Inverser" },
})

wk.add({
    { "<c-h>", "[{", desc = "Accolade précédente", mode = { "n", "v" } },
    { "<c-l>", "]}", desc = "Accolade suivante", mode = { "n", "v" } },
})
