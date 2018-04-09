
Sprite = Class{}

-- coordinates and one or more quads
function Sprite:init(x, y, quad, ...)
    self.x = x
    self.y = y
    self.quad = quad
end


function Sprite:update(dt)
    
end


function Sprite:draw()
    local atlas = texHandler.tex.atlas[self.quad.atlas]
    local xloc = math.floor((self.x - self.quad.wo * 0.5) * TILE_SIZE)
    local yloc = math.floor((self.y + 0.2 - self.quad.ho) * TILE_SIZE)
    love.graphics.draw(atlas.tex, self.quad.quad, xloc, yloc)
    --love.graphics.circle("fill", self.x * TILE_SIZE, self.y * TILE_SIZE, 2)
end
