
local t = {}

function t:init()
    self.players = {}
end


function t:update(dt)
    
end


function t:handleEvent(event)
    if event.type == "receive" then
        --log:info("Got message", event.data, event.peer)
        --event.peer:send( "pong" )
    elseif event.type == "connect" then
        --log:info(event.peer, "connected.")
        local id = event.peer:connect_id()
        self:createPlayer(id)
    elseif event.type == "disconnect" then
        --log:info(event.peer, "disconnected.")
    end
end


function t:createPlayer(id)
    local spawn = self.objectHandler.spawn
    if not spawn then
        log:debug("Can't read spawn for objectHandler")
    end
    local p = Player(id, spawn.x, spawn.y)
    p.sprite = self.animationHandler.heroes[math.random(1, #self.animationHandler.heroes)]
    log:info("New player connected: ", id, p.sprite)
    self.players[p.id] = p
    network:addMessage({ "spawn", entity.id, entity.x, entity.y })
end


return t
