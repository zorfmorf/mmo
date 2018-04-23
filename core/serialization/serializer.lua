
local t = {}

function t:init(objectHandler)
    self.objH = objectHandler
end


function t:deserializeEntity(v)
    local e = self.objH.layer.entities[v[1]]
    if e then
        e.x = v[2]
        e.y = v[3]
        e.state = {}
        e.state.ani = v[4]
        e.state.dir = v[5]
        e.state.n = v[6]
        e.state.xm = v[7]
        e.state.ym = v[8]
    else
        log:warn("Could not find object for", v)
    end
end


function t:serializeEntity(e)
    local xm = e.state.xmove
    local ym = e.state.ymove
    if not xm then xm = "nil" end
    if not ym then ym = "nil" end
    return e.id.."#"..e.x.."#"..e.y.."#"..e.state.ani.."#"..e.state.dir.."#"..e.state.n.."#"..xm.."#"..ym
end


function t:deserializeMessage(m)
    local v = m:split("##")
    if v[1] then
        if v[1] == "update" then
            for i=2,#v do
                self:deserializeUpdate(v[i])
            end
        elseif v[1] == "spawn" then
            
        end
    end
end


function t:deserializeSpawn(m)
    --"spawn".."##"..p.id.."#"..p.sprite.."#"..p.x.."#"..p.y
    if m then
        local v = m:split("#")
        if #v == 4 then
            local p = Entity(0, 0)
            p.id = v[1]
            p.state.sprite = v[2]
            p.x = v[3]
            p.y = v[4]
            self.objH:addEntity(p)
        else
            log:warn("Received invalid update message", m)
        end
    end
end


function t:deserializeUpdate(m)
    if m then
        local v = m:split("#")
        if #v == 8 then
            self:deserializeEntity(m)
        else
            log:warn("Received invalid update message", m)
        end
    end
end

return t