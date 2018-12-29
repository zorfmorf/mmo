local enet = require "enet"

-- General connectivity interface for clients and servers

local network = {}


function network:init(location, port, serializer)
    self.location = location
    self.port = port
    if serializer then
	self.serializer = serializer
    else
	-- placeholder serializer in case none was passed
	self.serializer = {
		serialize = function(message) return message end,
		deserialize = function(message) return message end
	    }
    end
end


-- Connect as a client
function network:connect()
    self.host = enet.host_create()
    self.server = self.host:connect(self.location .. ":" .. self.port)
    log:info("Connecting to", self.location, ":", self.port)
end


-- Host as a server
function network:create()
    self.host = enet.host_create(self.location .. ":" .. self.port)
    self.queue = {}
    log:info("Bound server to", self.location, ":", self.port)
end


function network:disconnect()
    if self.server then
	self.server:disconnect_now()
    end
end


function network:read_inputs()
    local inputs = {}
    local event = self.host:service(0)
    while event do
	if event.type == "connect" then
	    log:info("Connect:", event.data, event.peer)
	elseif event.type == "disconnect" then
	    log:info("Disconnect:", event.data, event.peer)
	elseif event.type == "receive" then
	    -- TODO handle this properly. think about at which point deserialization is handled
	    event.message = self.serializer:deserialize(event.data)
	    log:debug("Receive:", event.data, event.peer)
	    table.insert(inputs, event)
	else
	    log:info("Unknown message:", event.data, event.peer)
	end
	event = self.host:service()
    end
    return inputs
end


-- Add a message to the message queue
function network:queueMessage(m)
    table.insert(self.queue, m)
end


-- Schedule sending of all outgoing messages
function network:sendQueue()
    for i,m in ipairs(self.queue) do
        if m.target == "all" then
            self.host:broadcast(m.data)
        else
            local peer = self.host:get_peer(m.target)
            if peer then
                peer:send(m.data)
            end
        end
    end
    self.queue = {}
end


-- Send out all outgoing packages
-- Not sure if we should call this or not
-- TODO performance analysis once we are further in development
function network:flush()
    self.host:flush()
end


return network

