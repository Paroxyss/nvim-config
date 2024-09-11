local util = require("plugins.cellAuto.util")
local config = {
	fps = 24,
	name = 'plague',
}

local getCase = util.getCase

config.init = function()
	frame = 1
end

local deltas = {
	{ 0,  1 },
	{ 1,  0 },
	{ 0,  -1 },
	{ -1, 0 },
}
config.update = function(grid)
	frame = frame + 1
	for prei = 0, #grid - 1 do
		local y = #grid - prei
		for x0 = 1, #(grid[y]) do
			local x = 2 * x0
			-- on n'évalue les cases en damier pour éviter une propagation plus rapide dans un sens que dans les autres
			if x > #(grid[y]) then
				x = x - math.ceil(#grid[y] / 2) * 2 - 1
			end
			local dir = deltas[math.random(#deltas)]

			local case = getCase(grid, x, y)

			--if case and case.char == '\t' then case.char = '    ' end

			local dest = getCase(grid, x + dir[1], y + dir[2])
			if dest ~= nil and dest.char == ' ' and case and not string.starts(case.hl_group, "@comment") then
				grid[y + dir[2]][x + dir[1]] = case
			end
		end
	end
	return true
end

return config
