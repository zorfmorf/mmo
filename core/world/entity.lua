
Entity = Class{}

function Entity:init(x, y)
    self.shape = "rectangle" -- only needed for sti library
    self.sprite = objectHandler:get("ranger")
    self.state = { x=0, y=3 }
    self.x = x
    self.y = y
    self.ox = self.sprite.xs / 2
    self.oy = self.sprite.ys / 1.05
end


function Entity:update(dt)
    self.state.x = self.state.x + 10 * dt
    if self.state.x >= 10 then self.state.x = self.state.x - 10 end
    -- 96 pixels per second
    local speed = 70

    -- Move player up
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        self.y = self.y - speed * dt
    end

    -- Move player down
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        self.y = self.y + speed * dt
    end

    -- Move player left
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        self.x = self.x - speed * dt
    end

    -- Move player right
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        self.x = self.x + speed * dt
    end
end

function Entity:draw()
    love.graphics.draw(
        self.sprite.texture,
        self.sprite.quad[math.floor(self.state.x)][math.floor(self.state.y)],
        math.floor(self.x),
        math.floor(self.y),
        0,
        1,
        1,
        self.ox,
        self.oy
    )

    -- Temporarily draw a point at our location so we know
    -- that our sprite is offset properly
    --love.graphics.setPointSize(5)
    --love.graphics.points(math.floor(self.x), math.floor(self.y))
end
