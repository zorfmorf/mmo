
Entity = Class{}

function Entity:init(x, y)
    self.type = "entity" -- to know how to draw it
    self.sprite = "cleric_male" -- actual sprite
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
    
    animationHandler:update(self, dt)
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
