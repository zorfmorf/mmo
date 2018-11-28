-- libs
Class = require "lib.hump.class" 

-- lua sockets mainly for millisecond precision and sleep methods
socket = require "socket"

-- enet TODO fix path? for linux?
local enet = require "enet"

-- own log handler
log = require "util.log"

-- configuration
-- TODO write config handler that generates default config if not existent
require "config"

-- enet wrapper for network handling
network = require "network.network"

-- event handling
events = require "network.events"

-- (re)actors
require "reactor.gameInstance"

-- create and run the individual (re)actors
local r = GameInstance(DEFAULT_SERVER_NAME, DEFAULT_GAME_PORT)

-- Initialize stuff
network:init("localhost", DEFAULT_GAME_PORT)
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
