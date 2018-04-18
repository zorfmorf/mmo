
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
        local index = event.peer:index()
        self:createPlayer(id, index)
    elseif event.type == "disconnect" then
        --log:info(event.peer, "disconnected.")
    end
end


function t:createPlayer(id, index)
    local spawn = self.objectHandler.spawn
    if not spawn then
        log:debug("Can't read spawn for objectHandler")
    end
    local p = Player(id, index, spawn.x, spawn.y)
    p.sprite = self.animationHandler.heroes[math.random(1, #self.animationHandler.heroes)]
    log:info("New player connected: ", id, p.sprite)
    self.players[p.id] = p
    network:addMessage({ 
                        message = "spawn",
                        target = "all",
                        body = "spawn".."#"..p.id.."#"..p.sprite.."#"..p.x.."#"..p.y
                    })
end
    --self.state = { ani = "idle", dir = "left", n = 1, xmove = nil, ymove = nil} -- animation state
    --self.x = x
    --self.y = y

function t:createUpdateMessage()
    local m = ""
    
    for i,e in pairs(self.objectHandler.layer.entities) do
        m = m.."##"..e.id.."#"..e.x.."#"..e.y.."#"..e.ani.."#"..e.dir.."#"..e.n.."#"..e.ani.."#"..e.xmove.."#"..e.ymove
    end
    
    network:addMessage({ 
                    message = "update",
                    target = "all",
                    body = m
                })
end


return t
