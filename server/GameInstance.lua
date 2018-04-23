-- A (re)actor for a single gameinstance
-- Handles a subset of the whole mmo world

SERVER = true

GameInstance = Class{}

-- simulate love functionality so STI will work
require "server.loveFaker"

-- map handling
sti = require "core.lib.sti"

-- classes
require "core.world.entity"
require "core.world.player"

function GameInstance:init(name, port)
    self.name = name
    self.port = port
    
    -- require stuff
    self.objectHandler = require "core.game.objectHandler"
    self.animationHandler = require "core.game.animationHandler"
    self.playerHandler = require "server.playerHandler"
    self.serializer = require "core.serialization.serializer"
    
    -- create connections
    self.playerHandler.objectHandler = self.objectHandler
    self.playerHandler.animationHandler = self.animationHandler
    self.playerHandler.serializer = self.serializer
    
    -- init game stuff
    self.map = sti("core/map/overworld.lua")
    self.playerHandler:init()
    self.objectHandler:init(self.map, self.animationHandler)
    self.serializer:init(self.objectHandler)
    self.animationHandler:init()
    
    -- dt counter
    self.dt = -1
end


-- 
function GameInstance:process_inputs(inputs)
    for i,event in ipairs(inputs) do
        self.playerHandler:handleEvent(event)
    end
end


-- Update the game world
function GameInstance:update(dt)
    self.map:update(dt)
    self.objectHandler:update(dt)
end


-- Send regular, delta-ed client updates
function GameInstance:post_updates_to_clients(dt)
    -- first create update messages for all client states
    self.playerHandler:createUpdateMessage()
    
    -- then send all queued, outgoing messages
    network:sendAll()
    network:flush()
end


-- Create a new event for the next run
function GameInstance:post_timer_event(event)
    events:create_timer_event(event.time + NETWORK_TICK_RATE)
end


-- (re)actor method
function GameInstance:react(event)
    assert(event and (event.typ == EVENT_TIMER), "No valid event passed")
    self:process_inputs(event.inputs)
    
    -- calculate dt and update server
    local dt = 0
    if self.dt > 0 then dt = event.time - self.dt end
    self:update(dt)
    
    -- send current state to clients
    self:post_updates_to_clients()
    
    -- create an event for the next round of updates
    self:post_timer_event(event)
end
