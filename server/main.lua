-- libs
Class = require "lib.hump.class" 

-- constants
require "constants"

-- event handling
require "events"

-- (re)actors
require "GameInstance"

-- create and run the individual (re)actors
local r = GameInstance("test.server", DEFAULT_GAME_PORT)

while(true) do
    local ev = wait_for_event()
    ev.inputs = read_inputs()
    r.react(ev)
end
