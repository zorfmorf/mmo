local t = {}

local location = "localhost"
local port = 25896

function t:init()
    self.host = enet.host_create()
    self.server = self.host:connect(location..":"..port)
    log:info("Connecting to", location, ":", port)
end


function t:read_inputs()
    -- placeholder network code
    local event = self.host:service(0)
    while event do
        if event.type == "receive" then
            print("Got message: ", event.data, event.peer)
            --event.peer:send( "ping" )
        elseif event.type == "connect" then
            --print(event.peer, "connected.")
            --event.peer:send( "ping" )
        elseif event.type == "disconnect" then
            --print(event.peer, "disconnected.")
        end
        event = self.host:service(0)
    end
end


return t
