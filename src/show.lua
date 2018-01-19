local square = {
  white = ' ',
  black = '#'
}

local ant = {
  north = '^',
  east = '>',
  south = 'v',
  west = '<'
}

local grid_size = 21
local delta = grid_size // 2

return function(state)
  local rows = {}

  for y = state.ant.y + delta, state.ant.y - delta, -1 do
    local row = ''
    for x = state.ant.x - delta, state.ant.x + delta, 1 do
      if x == state.ant.x and y == state.ant.y then
        row = row .. ant[state.ant.direction]
      else
        row = row .. square[state.board.at(x, y)]
      end
    end
    table.insert(rows, row)
  end

  return table.concat(rows, '\n')
end
