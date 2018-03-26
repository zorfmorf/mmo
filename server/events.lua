-- different type of timer events
EVENT_TIMER = 1

local events = {}
events.queue = {}


events.wait_for_event = function()
    local i, nex = next(events.queue)
    assert (i and nex, "event queue is empty")
    local now = socket.gettime()
    local dt = nex.time - now
    if dt > 0 then socket.sleep(dt) end
    table.remove(events.queue, i)
    return nex
end


events.create_timer_event = function(time)
    
    -- create new timer event if not given
    time = time or math.floor(socket.gettime() + 1) + NETWORK_TICK_RATE
    
    -- if the created event is in the past, move it to now and note this
    local now = socket.gettime()
    if time - now < 0 then 
        log:warn("Creating event in past")
        time = now
    end
    table.insert(events.queue, { run = function() log:info("Running event ", tostring(time)) end, time = time, typ = EVENT_TIMER })
end

return events
