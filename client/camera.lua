
local camera = {}


function camera:init()
    -- current game world coordinate the camera is supposed to be focused on
    self.x = 0
    self.y = 0
    
    -- actual game world coordinates the camera is focused on
    -- needed so we can have a "trailing" camera effect
    self.xc = 0
    self.yc = 0
end


function camera:update()
    -- todo: move gracefully to target destination
end


-- focus a given location
function camera:focus(x, y)
    -- todo: not immediately set to actual target
    self.x = x
    self.y = y
    self.xc = x
    self.yc = y
end


function camera:left()
    self.xc = self.xc - 1
end


function camera:right()
    self.xc = self.xc + 1
end


function camera:up()
    self.yc = self.yc - 1
end


function camera:down()
    self.yc = self.yc + 1
end


function camera:getVisibleScreenSize()
    return love.graphics.getWidth() / TEXTURE_SCALING, love.graphics.getHeight() / TEXTURE_SCALING
end


-- returns the upper left and lower right coordinates of visible chunks
function camera:getChunkCoordinates()
    local xw, yw  = self:getVisibleScreenSize()
    local xts = self.xc - xw / (TILE_SIZE * 2)
    local xte = self.xc + xw / (TILE_SIZE * 2)
    local yts = self.yc - yw / (TILE_SIZE * 2)
    local yte = self.yc + yw / (TILE_SIZE * 2)
    return math.floor(xts / WORLD_CHUNK_SIZE), math.floor(yts / WORLD_CHUNK_SIZE), math.floor(xte / WORLD_CHUNK_SIZE), math.floor(yte / WORLD_CHUNK_SIZE)
end


-- apply the current camera state to graphics
function camera:apply()
    local xw, yw  = self:getVisibleScreenSize()
    local xf = (self.xc + 0.5) * TILE_SIZE
    local yf = (self.yc + 0.5) * TILE_SIZE
    return math.floor(xw / 2 - xf), math.floor(yw / 2 - yf)
end


return camera