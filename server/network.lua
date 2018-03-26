
local network = {}

function network:init(port)
    self.host = enet.host_create("localhost:" .. port)
end


function network:read_inputs()
    local inputs = {}
    local event = self.host:service(100)
    while event do
        if event.type == "receive" then
            log:info("Got message: ", event.data, event.peer)
            event.peer:send( "pong" )
        elseif event.type == "connect" then
            log:info(event.peer, "connected.")
        elseif event.type == "disconnect" then
            log:info(event.peer, "disconnected.")
        end
        event = self.host:service()
    end
    return inputs
end


return network
