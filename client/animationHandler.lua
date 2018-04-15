
local t = {}

function t:init()
    self.anim = {}
    
    local name = "butterfly"
    self:load(name, "butterfly", 32, 32, 8)
    self:addMove(name, "idle", "left", false, 0, 10, true) -- does not exist actually
    self:addMove(name, "move", "left", false, 0, 10, true)
    self:addMove(name, "attack", "left", false, 1, 10, false)
    
    name = "cleric_male"
    self:load(name, "cleric", 32, 32, 10)
    self:addMove(name, "idle", "left", true, 0, 10, true)
    self:addMove(name, "special", "left", true, 1, 5, false)
    self:addMove(name, "move", "left", true, 2, 20, true)
    self:addMove(name, "attack", "left", true, 3, 6, false)
    self:addMove(name, "die", "left", true, 4, 4, false)
    
    name = "cleric_female"
    self:load(name, "cleric", 32, 32, 10)
    self:addMove(name, "idle", "left", true, 5, 3, true)
    self:addMove(name, "special", "left", true, 6, 5, false)
    self:addMove(name, "move", "left", true, 7, 20, true)
    self:addMove(name, "attack", "left", true, 8, 6, false)
    self:addMove(name, "die", "left", true, 9, 5, false)
end


function t:load(name, fileName, xs, ys, n)
    local r = {}
    r.img = love.graphics.newImage("core/res/"..fileName..".png")
    r.xs = xs
    r.ys = ys
    r.ox = xs / 2
    r.oy = ys / 1.05
    r.n = n
    r.state = {}
    r.quad = {}
    self.anim[name] = r
end


function t:addMove(name, move, dir, revert, row, speed, looping)
    local addOtherDirection = false
    
    local ani = self.anim[name]
    local m = ani.state[move]
    if not m then 
        m = {}
        -- new so add other direction as well for convenience
        addOtherDirection = true
    end
    m.looping = looping
    m[dir] = {}
    m[dir].revert = 1
    if revert then m[dir].revert = -1 end
    for i=1,ani.n do
        local qn = #ani.quad + 1
        ani.quad[qn] = love.graphics.newQuad((i - 1) * ani.xs, row * ani.ys, 
                                        ani.xs, ani.ys, ani.img:getDimensions())
        m[dir][i] = { quad = qn, speed = speed }
    end
    self.anim[name].state[move] = m
    if addOtherDirection then 
        local newDir = "left"
        if dir == newDir then newDir = "right" end
        self:addMove(name, move, newDir, not revert, row, speed, looping)
    end
end


function t:getDrawInformation(sprite, state)
    local ani = self.anim[sprite]
    local info = ani.state[state.ani][state.dir][math.floor(state.n)]
    return ani.img, ani.quad[info.quad], ani.ox, ani.oy, ani.state[state.ani][state.dir].revert
end


function t:getUpdateInformation(sprite, state)
    local ani = self.anim[sprite]
    return ani.n, ani.state[state.ani][state.dir][math.floor(state.n)].speed
end


function t:update(entity, dt)
    -- switch animation if necessary
    if entity.state.xmove or entity.state.ymove then
        if entity.state.ani == "idle" then entity.state.ani = "move" end
        if entity.state.xmove then
            entity.state.dir = "left"
            if entity.state.xmove > 0 then entity.state.dir = "right" end
        end
    else
        if entity.state.ani == "move" then entity.state.ani = "idle" end
    end
    
    -- update animation
    local aniState = self.anim[entity.sprite].state[entity.state.ani]
    local n, s = self:getUpdateInformation(entity.sprite, entity.state)
    entity.state.n = entity.state.n + s * dt
    if entity.state.n >= n + 1 then
        if aniState.looping then 
            entity.state.n = entity.state.n % n + 1
        else
            entity.state.n = n
        end
    end
end


return t