
local t = {}

function t:init()
    self.anim = {}
    self.heroes = {}
    
    self:addDefaultCharacterAnimations("cleric_male", "cleric", 0, true)
    self:addDefaultCharacterAnimations("cleric_female", "cleric", 5, true)
    self:addDefaultCharacterAnimations("goblin", "goblin", 0, false)
    self:addDefaultCharacterAnimations("goblin_shaman", "goblin", 5, false)
    self:addDefaultCharacterAnimations("orc", "orc", 0, false)
    self:addDefaultCharacterAnimations("orc_rogue", "orc", 5, false)
    self:addDefaultCharacterAnimations("ranger_male", "ranger", 0, true)
    self:addDefaultCharacterAnimations("ranger_female", "ranger", 5, true)
    self:addDefaultCharacterAnimations("rogue_male", "rogue", 0, true)
    self:addDefaultCharacterAnimations("rogue_female", "rogue", 5, true)
    self:addDefaultCharacterAnimations("warrior_male", "warrior", 0, true)
    self:addDefaultCharacterAnimations("warrior_female", "warrior", 5, true)
    self:addDefaultCharacterAnimations("wizard_male", "wizard", 0, true)
    self:addDefaultCharacterAnimations("wizard_female", "wizard", 5, true)
    
    local name = "butterfly"
    self:load(name, "butterfly", 32, 32, 8)
    self:addMove(name, "idle", "left", false, 0, false, { 10 }) -- does not exist actually
    self:addMove(name, "move", "left", false, 0, true, { 10 })
    self:addMove(name, "attack", "left", false, 1, true, { 10 })
    
    name = "eyeball"
    self:load(name, "eyeball", 32, 32, 8)
    self:addMove(name, "idle", "left", false, 0, false, { 10 })
    self:addMove(name, "move", "left", false, 1, true, { 10 })
    self:addMove(name, "attack", "left", false, 2, true, { 10 })
    
    name = "deer_male"
    self:load(name, "deer_male", 32, 32, 5)
    self:addMove(name, "idle", "left", true, 0, false, { 2 })
    self:addMove(name, "move", "left", true, 2, true, { 10 })
    self:addMove(name, "move", "up", true, 2, true, { 10 })
    self:addMove(name, "special", "left", true, 1, false, { 5, 3, 0.5, 3, 5 })
    
    name = "deer_female"
    self:load(name, "deer_female", 32, 32, 5)
    self:addMove(name, "idle", "left", true, 0, false, { 2 })
    self:addMove(name, "move", "left", true, 2, true, { 10 })
    self:addMove(name, "special", "left", true, 1, false, { 5, 3, 0.5, 3, 5 })
    
    -- TODO
    name = "knight"
    self:load(name, "knight", 32, 32, 5)
    self:addMove(name, "idle", "left", true, 0, true, { 2 }) -- does not exist actually
end

function t:addDefaultCharacterAnimations(name, file, offset, hero)
    self:load(name, file, 32, 32, 10)
    self:addMove(name, "idle", "left", true, 0 + offset, false, { 3 })
    self:addMove(name, "special", "left", true, 1 + offset, false, { 15 })
    self:addMove(name, "move", "left", true, 2 + offset, true, { 15 })
    self:addMove(name, "attack", "left", true, 3 + offset, false, { 18 })
    self:addMove(name, "die", "left", true, 4 + offset, false, { 5 })
    if hero then table.insert(self.heroes, name) end
end


function t:load(name, fileName, xs, ys, n)
    local r = {}
    if not SERVER then r.img = love.graphics.newImage("core/res/"..fileName..".png") end
    r.xs = xs
    r.ys = ys
    r.ox = xs / 2
    r.oy = ys / 1.05
    r.n = n
    r.state = {}
    r.quad = {}
    self.anim[name] = r
end


function t:addMove(name, move, dir, revert, row, looping, ...)
    local addOtherDirection = false
    local ani = self.anim[name]
    local m = ani.state[move]
    if not m then 
        m = {}
        -- new so add other direction as well for convenience
        addOtherDirection = true
    end
    
    -- handle different animation speeds for the same animation queue
    local speeds = {}
    local lastSpeed = 0
    for i,v in ipairs(...) do
        speeds[i] = v
        lastSpeed = v
    end
    for i=1,ani.n do
        if not speeds[i] then speeds[i] = lastSpeed end
    end
    
    m.looping = looping
    m[dir] = {}
    m[dir].revert = 1
    if revert then m[dir].revert = -1 end
    for i=1,ani.n do
        local qn = #ani.quad + 1
        if SERVER then
            ani.quad[qn] = "quad"
        else
            ani.quad[qn] = love.graphics.newQuad((i - 1) * ani.xs, row * ani.ys, 
                                        ani.xs, ani.ys, ani.img:getDimensions())
        end
        
        m[dir][i] = { quad = qn, speed = speeds[i] }
    end
    self.anim[name].state[move] = m
    if addOtherDirection then 
        local newDir = "left"
        if dir == newDir then newDir = "right" end
        self:addMove(name, move, newDir, not revert, row, looping, ...)
    end
end

function t:getDrawInformation(sprite, state)
    local ani = self.anim[sprite]
    if state.default then
        local info = ani.state["idle"][state.dir][1]
        return ani.img, ani.quad[info.quad], ani.ox, ani.oy, ani.state[state.ani][state.dir].revert
    end
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
        if not (entity.state.ani == "move") then 
            entity.state.ani = "move"
            entity.state.n = 1
            entity.state.default = false
        end
        if entity.state.xmove then
            entity.state.dir = "left"
            if entity.state.xmove > 0 then entity.state.dir = "right" end
        end
    else
        if entity.state.ani == "move" then
            entity.state.n = 1
        end
    end
    
    -- update animation
    local aniState = self.anim[entity.sprite].state[entity.state.ani]
    local n, s = self:getUpdateInformation(entity.sprite, entity.state)
    
    -- only advance animations if we are not displaying the default animation
    if not (entity.state.ani.default) then
        entity.state.n = entity.state.n + s * dt
    end
    
    -- loop around or fall back to default animation
    if entity.state.n >= n + 1 then
        if aniState.looping then 
            entity.state.n = entity.state.n % n + 1
        else
            if entity.state.ani == "die" then
                entity.state.n = n
            else
                if self.anim[entity.sprite].state["idle"] then
                    entity.state.n = 1
                    entity.state.default = true
                end
            end
        end
    end
end


return t