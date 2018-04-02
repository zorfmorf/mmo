
local texHandler = {}

local files = {}
table.insert(files, "tileset")

-- load all texture files
function texHandler:init()
    
    -- make sure textures are not smoothed when scaled
    love.graphics.setDefaultFilter( "nearest", "nearest", 1)
    
    self.tex = {}
    self.tex.atlas = {}
    self.tex.tile = {}
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
                    atlas.x = math.floor(tonumber(tex[1]))
                    atlas.y = math.floor(tonumber(tex[2]))
                    atlas.name = v[3]
                    atlas.tex = love.graphics.newImage(name .. ".png")
                    self.tex.atlas[atlas.name] = atlas
                else
                    log:err("Invalid descriptor header", name, v)
                end
            else
                if table.getn(v) == DESCRIPTOR_ENTRIES_CONTENT then
                    -- add quad
                    local x = tonumber(v[1])
                    local y = tonumber(v[2])
                    local name = v[3]
                    local qx = math.floor(x * atlas.x)
                    local qy = math.floor(y * atlas.y)
                    local t = v[4]
                    local wo = tonumber(v[5])
                    local ho = tonumber(v[6])
                    local w = math.floor(wo * atlas.x) 
                    local h = math.floor(ho * atlas.y)
                    local quad = love.graphics.newQuad( qx, qy, w, h, atlas.tex:getDimensions())
                    table.insert(self.tex[t], { atlas = atlas.name, quad = quad, t=t, w=w, h=h, wo=wo, ho=ho })
                else
                    log:err("Invalid descriptor content", name, tostring(v))
                end
            end
        end
    else
        log:err("Can't find texture or descriptor file with name", name)
    end
end

return texHandler