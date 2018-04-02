
World = Class{}

function World:init()
    self.chunks = {}
    
    -- TODO remove, just for testing purposes
    local chunk = self:get(0, 0)
    for i=1,WORLD_CHUNK_SIZE do
        chunk[i - 1] = {}
        for j=1,WORLD_CHUNK_SIZE do
            chunk[i - 1][j - 1] = texHandler.tex.tile[math.random(1, 20)]
        end
    end
    chunk.sprites = {}
    for i=1,10 do
        chunk.sprites[i] = Sprite(math.random(1, WORLD_CHUNK_SIZE) - 1, math.random(1, WORLD_CHUNK_SIZE) - 1, texHandler.tex.sprite[math.random(1, 8)])
    end
    self.chunks[0][0] = chunk
end


function World:get(x, y)
    if not self.chunks[x] then self.chunks[x] = {} end
    if not self.chunks[x][y] then self.chunks[x][y] = {} end
    return self.chunks[x][y]
end
