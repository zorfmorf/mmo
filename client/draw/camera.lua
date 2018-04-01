
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


function camera:focus(x, y)
    -- todo: not immediately set to actual target
    self.x = x
    self.y = y
    self.xc = x
    self.yc = y
end


function camera:getVisibleScreenSize()
    return love.graphics.getWidth() / (2 * TEXTURE_SCALING), love.graphics.getHeight() / (2 * TEXTURE_SCALING)
end


-- returns the upper left and lower right coordinates of visible chunks
function camera:getChunkCoordinates()
    local xw, yw  = self:getVisibleScreenSize()
end


-- apply the current camera state to graphics
function camera:apply()
    local xw, yw  = self:getVisibleScreenSize()
    local xf = (self.xc + 0.5) * TILE_SIZE
    local yf = (self.yc + 0.5) * TILE_SIZE
    love.graphics.translate(math.floor(xw - xf), math.floor(yw - yf))
end


return camera