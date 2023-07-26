local ca = require("cellular-automaton")
local wk = require("which-key")

wk.register({
	["<leader>c"] = {
		name = "Cellular",
		s = { ":CellularAutomaton sand<CR>", "Sand" }
	}
})

local sand = require("plugins.cellAuto.sand")

ca.register_animation(sand)
