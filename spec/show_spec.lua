describe('show', function()
  local State = require 'State'
  local show = require 'show'

  it('should show a 21x21 grid centered on the ant', function()
    local state = State()
    state.ant.x = 100
    state.ant.y = 1000
    state.ant.direction = 'north'
    state.board.flip(103, 1003)
    state.board.flip(110, 1010)
    state.board.flip(102, 999)
    state.board.flip(9, 3)
    state.board.flip(98, 1001)

    local expected = ''
      .. '                    #' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '             #       ' .. '\n'
      .. '                     ' .. '\n'
      .. '        #            ' .. '\n'
      .. '          ^          ' .. '\n'
      .. '            #        ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     ' .. '\n'
      .. '                     '

    assert.are.equal(expected, show(state))
  end)

  it('should show the proper orientation of the ant', function()
    local state = State()

    state.ant.direction = 'north'
    assert.are.equal('^', show(state):sub(231, 231))

    state.ant.direction = 'east'
    assert.are.equal('>', show(state):sub(231, 231))

    state.ant.direction = 'south'
    assert.are.equal('v', show(state):sub(231, 231))

    state.ant.direction = 'west'
    assert.are.equal('<', show(state):sub(231, 231))
  end)
end)
