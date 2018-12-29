-- libs
Class = require "lib.hump.class" 

-- lua sockets for millisecond precision and sleep methods
-- we don't use the actual networking capabilities
socket = require "socket"

-- own log handler
log = require "core.util.log"

-- configuration
-- TODO write config handler that generates default config if not existent
require "config"

-- custom hold(TM) networking library
network = require "lib.hold.network"

-- event handling
events = require "event.events"

-- (re)actors
require "reactor.gameInstance"

-- create and run the individual (re)actors
local r = GameInstance(DEFAULT_SERVER_NAME, DEFAULT_GAME_PORT)

-- Initialize stuff. TODO provide serializer
network:init("localhost", DEFAULT_GAME_PORT, nil)
network:create()
events:init()

-- create an initial timer event to kick off everything
events:create_timer_event()

-- handle event queue and react to events
while(true) do
    local ev = events:wait_for_event()
    ev.run()
    ev.inputs = network:read_inputs()
    r:react(ev)
end

