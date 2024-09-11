function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

return {
	getCase = function(grid, x, y)
		if (grid[y] == nil) then
			return nil
		else
			return grid[y][x]
		end
	end,
	swap = function(grid, sx, sy, dx, dy)
		local dcase = grid[dy][dx]

		grid[dy][dx] = grid[sy][sx]
		grid[sy][sx] = dcase
	end
}
