local ccw = {
  north = 'west',
  east = 'north',
  south = 'east',
  west = 'south'
}

local cw = {
  north = 'east',
  east = 'south',
  south = 'west',
  west = 'north'
}

local dx = {
  north = 0,
  east = 1,
  south = 0,
  west = -1
}

local dy = {
  north = 1,
  east = 0,
  south = -1,
  west = 0
}

return function(state)
  if state.board.at(state.ant.x, state.ant.y) == 'white' then
    state.ant.direction = cw[state.ant.direction]
  else
    state.ant.direction = ccw[state.ant.direction]
  end

  state.board.flip(state.ant.x, state.ant.y)
  state.ant.x = state.ant.x + dx[state.ant.direction]
  state.ant.y = state.ant.y + dy[state.ant.direction]
end
