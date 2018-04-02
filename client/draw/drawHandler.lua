
local drawHandler = {}

function drawHandler:init()
    
end


function drawHandler:draw(world)
    love.graphics.scale(TEXTURE_SCALING, TEXTURE_SCALING)
    camera:apply()
    
    local xs, ys, xe, ye = camera:getChunkCoordinates()
    local drawItems = {} -- list of sprites and actors to draw
    for cx = xs, xe do
        for cy = ys, ye do
            local chunk = world:get(cx, cy)
            if chunk then
                
                -- draw tiles
                love.graphics.setColor(255, 255, 255, 255)
                for i=1,WORLD_CHUNK_SIZE do
                    for j=1,WORLD_CHUNK_SIZE do
                        if chunk[i - 1] then
                            local quad = chunk[i - 1][j - 1]
                            if quad then
                                local atlas = texHandler.tex.atlas[quad.atlas]
                                local x = math.floor((i - 1) * atlas.x)
                                local y = math.floor((j - 1) * atlas.y)
                                love.graphics.draw(atlas.tex, quad.quad, x, y)
                            end
                        end
                    end
                end
                
                -- collect sprites (if any)
                if chunk.sprites then
                    for i,s in pairs(chunk.sprites) do
                        table.insert(drawItems, s)
                    end
                end
                
                -- draw editor stuff
                if EDITOR_MODE then
                    love.graphics.setColor(200, 100, 100, 100)
                    love.graphics.rectangle("line", cx, cy, WORLD_CHUNK_SIZE * TILE_SIZE, WORLD_CHUNK_SIZE * TILE_SIZE)
                end
            end
        end
    end
    
    -- draw all actors and sprites, starting with the uppermost items first
    love.graphics.setColor(255, 255, 255, 255)
    for i,s in spairs(drawItems, function(t,a,b) return t[b].y < t[a].y end) do
        s:draw()
    end
end


return drawHandler