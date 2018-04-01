
local texHandler = {}

local files = {}
table.insert(files, "tileset")

-- load all texture files
function texHandler:init()
    self.tex = {}
    self.tex.atlas = {}
    self.tex.tiles = {}
    self.tex.sprite = {}
    self.tex.actor = {}
    for i,name in ipairs(files) do
        self:loadTexture("res/" .. name)
    end
end


function texHandler:loadTexture(name)
    if love.filesystem.isFile( name .. ".txt" ) and
            love.filesystem.isFile( name .. ".png" ) then
        local descriptor = love.filesystem.newFile( name .. ".txt" )
        descriptor:open("r")
        local atlas = {}
        for line in descriptor:lines() do
            local v = line:split(',')
            if v[1] == "#" then
                if table.getn(v) == DESCRIPTOR_ENTRIES_HEADER then
                    -- add new texture atlas
                    local tex = v[2]:split("x")
                    atlas.x = tex[1]
                    atlas.y = tex[2]
                    atlas.type = v[3]
                    atlas.name = v[4]
                    atlas.tex = love.graphics.newImage(name .. ".png")
                    if name == "res/tileset" then local data = self:importTexture(name .. ".png") end
                    self.tex.atlas[atlas.name] = atlas
                else
                    log:err("Invalid descriptor header", name, v)
                end
            else
                if table.getn(v) == DESCRIPTOR_ENTRIES_CONTENT then
                    -- add quad
                    local x = v[1]
                    local y = v[2]
                    local name = v[3]
                    local quad = love.graphics.newQuad( x * atlas.x, y * atlas.y, atlas.x, atlas.y, atlas.tex:getDimensions())
                    table.insert(self.tex[atlas.type], { atlas.name, quad})
                else
                    log:err("Invalid descriptor content", name, tostring(v))
                end
            end
        end
    else
        log:err("Can't find texture or descriptor file with name", name)
    end
end


function texHandler:importTexture(path)
    local data = love.image.newImageData(path)
    local xw = data:getWidth() * TEXTURE_SCALING
    local yw = data:getHeight() * TEXTURE_SCALING
    local result = love.image.newImageData(xw, yw)
    for i=1,xw do
        for j=1,yw do
            local x = math.floor((i - 1) / TEXTURE_SCALING)
            local y = math.floor((j - 1) / TEXTURE_SCALING)
            local r, g, b, a = data:getPixel(x, y)
            result:setPixel(i - 1, j - 1, r, g, b, a)
            print ("finished pixel", i, j)
        end
    end
    return result
end


return texHandler