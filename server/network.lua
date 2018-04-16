
local network = {}

function network:init(location, port)
    self.host = enet.host_create(location .. ":" .. port)
    log:info("Bound server to", location, ":", port)
    self.queue = {}
end


function network:read_inputs()
    local inputs = {}
    local event = self.host:service(0)
    while event do
        table.insert(inputs, event)
        event = self.host:service(0)
    end
    return inputs
end


function network:addMessage(m)
    table.insert(self.queue, m)
end


return network
