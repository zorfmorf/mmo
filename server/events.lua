-- different type of timer events
EVENT_TIMER = 1

local events = {}

function events:init()
    self.queue = {}
end


function events:wait_for_event()
    local i, nex = next(self.queue)
    assert (i and nex, "event queue is empty")
    local now = socket.gettime()
    local dt = nex.time - now
    if dt > 0 then socket.sleep(dt) end
    table.remove(self.queue, i)
    return nex
end


function events:create_timer_event(time)
    
    -- create a timepoint in one network tick if none was given
    time = time or math.floor(socket.gettime() + 1) + NETWORK_TICK_RATE
    
    -- if the created event is in the past, move it to now and note this
    local now = socket.gettime()
    if time - now < 0 then 
        log:warn("Creating event in past")
        time = now
    end
    
    -- finally create a new event and add it to queue
    table.insert(self.queue, { run = function() log:debug("Running event ", tostring(time)) end, time = time, typ = EVENT_TIMER })
end

return events
