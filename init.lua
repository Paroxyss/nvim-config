require('core.plugins')
require('core.keymaps')
require('core.settings')
require('core.options')
require('core.autocmds')
require('plugins.dap')

vim.g.instant_username = "william"

-- Vimtex config (à bouger)
vim.g.vimtex_view_method = 'sioyek'

local wk = require("which-key")
wk.add({
	{ "<leader>o", ':OverseerToggle<CR>', desc = "toggle overseer" },
})
