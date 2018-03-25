-- A (re)actor for a single gameinstance
-- Handles a subset of the whole mmo world

GameInstance = Class{}

function GameInstance:init(name, port)
    self.name = name
    self.port = port
end


-- 
function GameInstance:process_inputs(inputs)
    
end


-- Update the game world
function GameInstance:update(dt)
    
end


-- Send regular, delta-ed client updates
function GameInstance:post_updates_to_clients(dt)
    
end


-- Create a new event for the next run
function GameInstance:post_timer_event(time_left)
    
end


-- (re)actor method
function GameInstance:react(event)
    assert event.type == EVENT_TIMER
    self:process_inputs(event.inputs)
    self:update()
    self:post_updates_to_clients()
    
    -- create an event for the next round of updates
    self:post_timer_event(time_left_until_end_of_network_tick)
end