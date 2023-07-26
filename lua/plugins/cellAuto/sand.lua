local config = {
	fps = 24,
	name = 'sand',
}

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

local function getCase(grid, x, y)
	if (grid[y] == nil) then return nil
	else
		return grid[y][x]
	end
end

local function swap(grid, sx, sy, dx, dy)
	local dcase = grid[dy][dx]

	grid[dy][dx] = grid[sy][sx]
	grid[sy][sx] = dcase
end

local function shouldIgnore(c)
	return string.starts(c.hl_group, "@comment")
end

local function couldSwap(a, dest)
	return (not shouldIgnore(dest)) and (dest.char == ' ' or a.hl_group > dest.hl_group) -- or (a.hl_group == dest.hl_group and a.char > dest.char))
end

config.init = function()
	frame = 1
end

config.update = function(grid)
	frame = frame + 1
	for prei = 0, #grid - 1 do
		local y = #grid - prei
		for x0 = 1, #(grid[y]) do
			local x
			if (frame) % 2 == 0 then
				x = x0
			else
				x = #grid[y] + 1 - x0
			end

			local case = getCase(grid, x, y)

			if (case == nil) then goto continue end
			if (case.char == '\t') then case.char = ' ' end
			if (case.char == ' ') then goto continue end
			if shouldIgnore(case) then goto continue end

			-- On_check si on peut descendre
			local bottom = getCase(grid, x, y + 1)
			if (bottom == nil) then goto continue end
			if (bottom.char == ' ') then
				swap(grid, x, y, x, y + 1)
				goto continue
			end

			--_Sinon_on_check si_on_peut tomber_à_gauche_où_à_droite
			local side = math.random(0, 1) * 2 - 1
			for _ = 0, 1 do
				local sideCase = getCase(grid, x + side, y + 1)
				if (sideCase and couldSwap(case, sideCase)) then
					swap(grid, x, y, x + side, y + 1)
					goto continue
				end
				side = side * -1
			end

			-- Sinon on échange les plus lourds
			local top = getCase(grid, x, y - 1)
			if (top == nil or top.char == ' ') then goto continue end
			if (top.hl_group > case.hl_group) then
				swap(grid, x, y, x, y - 1)
				goto continue
			end


			::continue::
		end
	end
	return true
end

return config
