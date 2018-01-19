local State = require 'src.State'
local step = require 'src.step'
local show = require 'src.show'

local state = State()

for i = 1, 1000 do
  step(state)
  print(show(state))
  os.execute('sleep 0.05')
  os.execute('clear')
end
