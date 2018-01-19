describe('step', function()
  local State = require 'State'
  local step = require 'step'

  it('should turn CW, flip the location, and move forward when the ant is on white', function()
    local state = State()

    state.ant.x = 4
    state.ant.y = 6
    step(state)

    assert.are_equal(5, state.ant.x)
    assert.are_equal(6, state.ant.y)
    assert.are_equal('east', state.ant.direction)
    assert.are_equal('black', state.board.at(4, 6))
  end)

  it('should turn CCW, flip the location, and move forward when the ant is on black', function()
    local state = State()

    state.ant.x = 21
    state.ant.y = 3
    state.board.flip(21, 3)
    step(state)

    assert.are_equal(20, state.ant.x)
    assert.are_equal(3, state.ant.y)
    assert.are_equal('west', state.ant.direction)
    assert.are_equal('white', state.board.at(21, 3))
  end)

  it('should turn CW from north', function()
    local state = State()
    state.ant.direction = 'north'
    step(state)

    assert.are_equal('east', state.ant.direction)
  end)

  it('should turn CW from east', function()
    local state = State()
    state.ant.direction = 'east'
    step(state)

    assert.are_equal('south', state.ant.direction)
  end)

  it('should turn CW from south', function()
    local state = State()
    state.ant.direction = 'south'
    step(state)

    assert.are_equal('west', state.ant.direction)
  end)

  it('should turn CW from west', function()
    local state = State()
    state.ant.direction = 'west'
    step(state)

    assert.are_equal('north', state.ant.direction)
  end)

  it('should turn CCW from north', function()
    local state = State()
    state.ant.direction = 'north'
    state.board.flip(0, 0)
    step(state)

    assert.are_equal('west', state.ant.direction)
  end)

  it('should turn CCW from east', function()
    local state = State()
    state.ant.direction = 'east'
    state.board.flip(0, 0)
    step(state)

    assert.are_equal('north', state.ant.direction)
  end)

  it('should turn CCW from south', function()
    local state = State()
    state.ant.direction = 'south'
    state.board.flip(0, 0)
    step(state)

    assert.are_equal('east', state.ant.direction)
  end)

  it('should turn CCW from west', function()
    local state = State()
    state.ant.direction = 'west'
    state.board.flip(0, 0)
    step(state)

    assert.are_equal('south', state.ant.direction)
  end)

  it('should move forward from north', function()
    local state = State()
    state.ant.direction = 'west'
    step(state)

    assert.are_equal(0, state.ant.x)
    assert.are_equal(1, state.ant.y)
  end)

  it('should move forward from east', function()
    local state = State()
    state.ant.direction = 'north'
    step(state)

    assert.are_equal(1, state.ant.x)
    assert.are_equal(0, state.ant.y)
  end)

  it('should move forward from south', function()
    local state = State()
    state.ant.direction = 'east'
    step(state)

    assert.are_equal(0, state.ant.x)
    assert.are_equal(-1, state.ant.y)
  end)

  it('should move forward from west', function()
    local state = State()
    state.ant.direction = 'south'
    step(state)

    assert.are_equal(-1, state.ant.x)
    assert.are_equal(0, state.ant.y)
  end)
end)
