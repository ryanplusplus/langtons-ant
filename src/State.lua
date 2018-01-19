return function()
  local board = {}

  local at = function(x, y)
    return board[x .. '.' .. y] and 'black' or 'white'
  end

  local flip = function(x, y)
    if board[x .. '.' .. y] then
      board[x .. '.' .. y] = nil
    else
      board[x .. '.' .. y] = true
    end
  end

  return {
    ant = {
      x = 0,
      y = 0,
      direction = 'north'
    },

    board = {
      at = at,
      flip = flip
    }
  }
end
