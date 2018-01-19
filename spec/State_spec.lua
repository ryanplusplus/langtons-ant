describe('State', function()
  local State = require 'State'

  it("should default the ant's position and heading to (0, 0), north", function()
    local state = State()

    assert.are_equal(0, state.ant.x)
    assert.are_equal(0, state.ant.y)
    assert.are_equal('north', state.ant.direction)
  end)

  it('should default board locations to white', function()
    local state = State()

    assert.are_equal('white', state.board.at(0, 0))
    assert.are_equal('white', state.board.at(3, 5))
  end)

  it('should allow board locations to be flipped', function()
    local state = State()

    state.board.flip(5, 6)
    assert.are_equal('black', state.board.at(5, 6))

    state.board.flip(5, 6)
    assert.are_equal('white', state.board.at(5, 6))
  end)
end)
