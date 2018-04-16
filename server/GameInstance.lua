-- A (re)actor for a single gameinstance
-- Handles a subset of the whole mmo world

SERVER = true

GameInstance = Class{}

-- spoof love graphics module
love = {}
love.graphics = {}
love.graphics.isCreated = false
love.filesystem = {}
love.filesystem.load = function(path) return loadfile(path) end
love.data = {}

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
    
    -- create connections
    self.playerHandler.objectHandler = self.objectHandler
    self.playerHandler.animationHandler = self.animationHandler
    
    -- init game stuff
    self.map = sti("core/map/overworld.lua")
    self.playerHandler:init()
    self.objectHandler:init(self.map)
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