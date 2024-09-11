local ca = require("cellular-automaton")
local wk = require("which-key")

wk.register({
	["<leader>c"] = {
		name = "Cellular",
		s = { ":CellularAutomaton sand<CR>", "Sand" },
		p = { ":CellularAutomaton plague<CR>", "Plague" }
	}
})

local sand = require("plugins.cellAuto.sand")
local plague  = require("plugins.cellAuto.plague")

ca.register_animation(sand)
ca.register_animation(plague)
