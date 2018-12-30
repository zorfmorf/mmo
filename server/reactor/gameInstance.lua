-- A (re)actor for a single gameinstance
-- Handles a subset of the whole mmo world

GameInstance = Class{}

-- simulate love functionality so STI will work
require "serverutil.loveFaker"

-- require simple tiled implementation so maps can be loaded
require "lib.sti.init"


-- prepare triggers
local trigger = require "core.trigger.trigger"


function GameInstance:init(name, port)
    self.name = name
    self.port = port
    
    trigger:init()
    
    -- dt counter
    self.dt = -1
end


-- 
local function GameInstance:process_inputs(inputs)
    for i,event in ipairs(inputs) do
	-- Actually do something with received messages
    end
end


-- Update the game world
local function GameInstance:update(dt)

end


-- Send regular, delta-ed client updates
local function GameInstance:post_updates_to_clients(dt)
    -- first create update messages for all client states
    -- TODO network:queueMessage("test")

    -- then send all queued, outgoing messages
    network:sendQueue()
    -- network:flush()
end


-- Create a new event for the next run
local function GameInstance:post_timer_event(event)
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

