
local drawHandler = {}

function drawHandler:init()
    
end


function drawHandler:draw(world)
    love.graphics.scale(TEXTURE_SCALING, TEXTURE_SCALING)
    camera:apply()
    
    love.graphics.setColor(255, 255, 255)
    local xs, ys, xe, ye = camera:getChunkCoordinates()
    for cx = xs, xe do
        for cy = ys, ye do
            local chunk = world:get(cx, cy)
            if chunk then
                for i=1,WORLD_CHUNK_SIZE do
                    for j=1,WORLD_CHUNK_SIZE do
                        if chunk[i - 1] then
                            local quad = chunk[i - 1][j - 1]
                            if quad then
                                local atlas = texHandler.tex.atlas[quad.atlas]
                                local x = math.floor(0 + (i - 1) * atlas.x)
                                local y = math.floor(0 + (j - 1) * atlas.y)
                                love.graphics.draw(atlas.tex, quad.quad, x, y)
                            end
                        end
                    end
                end
            end
        end
    end
    
    love.graphics.origin()
    love.graphics.setColor(200, 100, 100)
    love.graphics.circle("fill", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 10)
end


return drawHandler