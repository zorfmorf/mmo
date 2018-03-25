
local socket = require("socket")
local queue = []

function wait_for_event()
    local i, nex = next(queue)
    assert i and nex
    local now = os.time()
    local dt = nex.time - now
    if dt > 0 then socket.sleep(dt) end
    table.remove(queue, i)
    return nex
end