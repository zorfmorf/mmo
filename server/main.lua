-- libs
Class = require "lib.hump.class" 

-- lua sockets mainly for millisecond precision and sleep methods
socket = require "socket"

-- configuration
require "defaultconfig"
require "config"

-- event handling
events = require "events"

-- (re)actors
require "GameInstance"

-- create and run the individual (re)actors
local r = GameInstance(DEFAULT_SERVER_NAME, DEFAULT_GAME_PORT)

-- create an initial timer event to kick off everything
events.create_timer_event()


-- placeholder method "read from client" until we actually implement that somewhere
function read_inputs()
    return nil
end


-- 
while(true) do
    local ev = events.wait_for_event()
    ev.run()
    ev.inputs = read_inputs()
    r:react(ev)
end
