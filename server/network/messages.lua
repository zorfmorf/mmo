-- General message handling

local messages = {}


function messages:init()

end


function messages:handleEvent(event)
    if event.type == "receive" then
        log:info("Got message", event.data, event.peer)
	--event.peer:send( "pong" )
    elseif event.type == "connect" then
        log:info(event.peer, "connected.")
	local id = event.peer:connect_id()
	local index = event.peer:index()
	self:createPlayer(id, index)
    elseif event.type == "disconnect" then
        log:info(event.peer, "disconnected.")
    end
end


return messages 
