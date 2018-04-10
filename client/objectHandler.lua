
local t = {}

function t:init(map)
    self.sprites = {}
    
    -- load all the known and relevant spritesheets
    self:load("ranger", "core/res/ranger.png", 32, 32)
    
    -- convert object layer to custom layer
    local layer = map:convertToCustomLayer(2)
    
    -- Get player spawn object
    local spawn
    for k, object in pairs(map.objects) do
        if object.name == "spawn" then
            spawn = object
            break
        end
    end

    layer.entities = {}
    
    -- Create player object
    local player = Entity(spawn.x, spawn.y)
    table.insert(layer.entities, player)

    -- Entity Updates
    layer.update = function(self, dt)
        layer.objects = {}
        for i,obj in pairs(map.objects) do
            layer.objects[i] = obj
        end
        for i,entity in pairs(layer.entities) do
            layer.objects[1000 + tonumber(i)] = entity
            entity:update(dt)
        end
        -- TODO: allocate only visible items to draw map
    end

    -- entity Drawing
    layer.draw = function(self)
        
        -- TODO remove the following stuff and just roll your own draw method
        local t = layer.type
        layer.type = "objectgroup"
        map:drawObjectLayer(layer)
        layer.type = t
    end
end


function t:load(name, path, xs, ys)
    local sprite = {}
    sprite.xs = xs
    sprite.ys = ys
    sprite.texture = love.graphics.newImage(path)
    local w = sprite.texture:getWidth()
    local h = sprite.texture:getHeight()
    local imax = math.floor(w / xs)
    local jmax = math.floor(h / ys)
    sprite.quad = {}
    for i=0,imax-1 do
        sprite.quad[i] = {}
        for j=0,jmax-1 do
            sprite.quad[i][j] = love.graphics.newQuad(i * xs, j * ys, xs, ys, sprite.texture:getDimensions())
        end
    end
    self.sprites[name] = sprite
end


function t:get(name)
    return self.sprites[name]
end

return t