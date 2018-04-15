
local t = {}


function t:init()
    -- current game world coordinate the camera is supposed to be focused on
    self.x = 0
    self.y = 0
    
    -- actual game world coordinates the camera is focused on
    -- needed so we can have a "trailing" camera effect
    self.xc = 0
    self.yc = 0
end


function t:getScreenCoordinates()
    local xw, yw = t:getVisibleScreenSize()
    local xts = self.xc - xw / (TILE_SIZE * 2)
    local xte = self.xc + xw / (TILE_SIZE * 2)
    local yts = self.yc - yw / (TILE_SIZE * 2)
    local yte = self.yc + yw / (TILE_SIZE * 2)
    return xts, xte, yts, yte
end


function t:update()
    -- todo: move gracefully to target destination
end


-- focus a given location
function t:focus(map, entity)
    local x, y = map:convertPixelToTile(entity.x, entity.y)
    -- todo: not immediately set to actual target
    self.x = x
    self.y = y
    self.xc = x
    self.yc = y
end


function t:left()
    self.xc = self.xc - 1
end


function t:right()
    self.xc = self.xc + 1
end


function t:up()
    self.yc = self.yc - 1
end


function t:down()
    self.yc = self.yc + 1
end


function t:getVisibleScreenSize()
    return love.graphics.getWidth() / TEXTURE_SCALING, love.graphics.getHeight() / TEXTURE_SCALING
end


-- returns the upper left and lower right coordinates of visible chunks
function t:getChunkCoordinates()
    local xw, yw  = self:getVisibleScreenSize()
    local xts = self.xc - xw / (TILE_SIZE * 2)
    local xte = self.xc + xw / (TILE_SIZE * 2)
    local yts = self.yc - yw / (TILE_SIZE * 2)
    local yte = self.yc + yw / (TILE_SIZE * 2)
    return math.floor(xts / WORLD_CHUNK_SIZE), math.floor(yts / WORLD_CHUNK_SIZE), math.floor(xte / WORLD_CHUNK_SIZE), math.floor(yte / WORLD_CHUNK_SIZE)
end


-- apply the current camera state to graphics
function t:apply()
    local xw, yw  = self:getVisibleScreenSize()
    local xf = (self.xc + 0.5) * TILE_SIZE
    local yf = (self.yc + 0.5) * TILE_SIZE
    return math.floor(xw / 2 - xf), math.floor(yw / 2 - yf)
end


return t