
Entity = Class{}

function Entity:init(x, y)
    self.id = math.random(1000000,9999999) -- TODO find actual range
    self.type = "entity" -- to know how to draw it
    self.sprite = "rogue_female" -- actual sprite
    self.state = { ani = "idle", dir = "left", n = 1, xmove = nil, ymove = nil} -- animation state
    self.x = x
    self.y = y
    self.speed = 60
end


function Entity:update(dt)
    -- 96 pixels per second
    local speed = self.speed
    if self.state.xmove and self.state.ymove then speed = speed / 1.2 end
    
    if self.state.ymove then self.y = self.y + self.state.ymove * speed * dt end
    if self.state.xmove then self.x = self.x + self.state.xmove * speed * dt end
end


function Entity:playAnimation(name)
    if not (self.state.ani == name) then
        self.state.xmove = nil
        self.state.ymove = nil
        self.state.n = 1
        self.state.ani = name
        self.state.default = false
    end
end


function Entity:updateAi(dt)
    -- do nothing per default
end


function Entity:draw()
    local tex, quad, ox, oy, s = animationHandler:getDrawInformation(self.sprite, self.state)
    if tex and quad then
        love.graphics.draw(
            tex,
            quad,
            math.floor(self.x),
            math.floor(self.y),
            0,
            1 * s,
            1,
            ox,
            oy
        )
    else
        log:debug("Unable to find entity sprite squad", self)
    end

    -- Temporarily draw a point at our location so we know
    -- that our sprite is offset properly
    --love.graphics.setPointSize(5)
    --love.graphics.points(math.floor(self.x), math.floor(self.y))
end
