local ca = require("cellular-automaton")
local wk = require("which-key")

wk.add({
    { "<leader>c", group = "Cellular" },
    { "<leader>cp", ":CellularAutomaton plague<CR>", desc = "Plague" },
    { "<leader>cs", ":CellularAutomaton sand<CR>", desc = "Sand" },
})
local sand = require("plugins.cellAuto.sand")
local plague  = require("plugins.cellAuto.plague")

ca.register_animation(sand)
ca.register_animation(plague)
