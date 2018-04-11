
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
            local xs,xe,ys,ye = camera:getScreenCoordinates()
            local x, y = map:convertPixelToTile(obj.x, obj.y)
            
            -- TODO calculate based on object size
            local BORDER_OBJECT_DRAW_OFFSET = 2
            local m = BORDER_OBJECT_DRAW_OFFSET
            if x > xs - m and x < xe + m and y > ys - m and y < ye + m then
                layer.objects[i] = obj
            end
        end
        for i,entity in pairs(layer.entities) do
            --if entity.x > xs - 1 and entity.x < xe + 1 and entity.y > ys - 1 and entity.y < ye + 1 then
                -- TODO don't use an arbitrary number 1000 and do it differently. also this limits us to 
                -- 1000 objectes per map which might become a problem with temporary objects
                -- TODO don't draw when off screen
                layer.objects[1000 + tonumber(i)] = entity
            --end
            entity:update(dt)
        end
    end

    -- entity Drawing
    layer.draw = function(self)
        
        -- iterate over the items in a sorted order
        for i,o in spairs(self.objects, 
                            function(t,a,b)
                                local l = t[a]
                                local r = t[b]
                                return l.y < r.y or (l.y == r.y and l.x < r.x) 
                            end) do
            -- it's a plain old map entity
            if o.gid then
                local tile = map.tiles[o.gid]
                if tile then
                    if tile.animation then
                        -- TODO wtf is happening here. if animations break its probably because of this
                        local t = map.tiles[o.gid + (tile.frame - 1)]
                        if t then tile = t end
                    end
                    love.graphics.draw(map.tilesets[tile.tileset].image, tile.quad, o.x, o.y, o.rotation, tile.sx, tile.sy, 0, o.height)
                end
            end
            -- it's one of our custom entities we can just draw them
            if o.type == "entity" then
                o:draw()
            end
        end
    end
    
    self.layer = layer
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