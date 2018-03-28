
World = Class{}

function World:init()
    self.chunks = {}
    
    -- TODO remove
    local chunk = self:get(0, 0)
    for i=1,WORLD_CHUNK_SIZE do
        chunk[i - 1] = {}
        for j=1,WORLD_CHUNK_SIZE do
            chunk[i - 1][j - 1] = texHandler.tex.tiles[math.random(1, 16)]
        end
    end
    self.chunks[0][0] = chunk
end


function World:get(x, y)
    if not self.chunks[x] then self.chunks[x] = {} end
    if not self.chunks[x][y] then self.chunks[x][y] = {} end
    return self.chunks[x][y]
end
