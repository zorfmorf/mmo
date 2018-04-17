
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

-- Send all outgoing messages
function network:sendAll()
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
function network:flush()
    self.host:flush()
end


return network
