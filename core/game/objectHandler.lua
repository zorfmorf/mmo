
local t = {}

function t:init(map)
    
    -- convert object layer to custom layer
    local layer = map:convertToCustomLayer(2)
    
    -- Get player spawn object
    for k, object in pairs(map.objects) do
        if object.name == "spawn" then
            self.spawn = object
            break
        end
    end

    layer.entities = {}

    -- Entity Updates
    layer.update = function(self, dt)
        
        -- just update entities for server
        if SERVER then
            for i,entity in pairs(layer.entities) do
                entity:update(dt)
                entity:updateAi(dt)
            end
        else
            -- on client we need to calculate what to draw
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
                    love.graphics.draw(map.tilesets[tile.tileset].image, tile.quad, math.floor(o.x), math.floor(o.y), o.rotation, tile.sx, tile.sy, 0, o.height)
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


function t:update(dt)
    --[[
    self.player.state.ymove = nil
    self.player.state.xmove = nil

    if not SERVER then
        -- Move player up
        if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
            self.player.state.ymove = -1
        end

        -- Move player down
        if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
            self.player.state.ymove = 1
        end

        -- Move player left
        if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
            self.player.state.xmove = -1
        end

        -- Move player right
        if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
            self.player.state.xmove = 1
        end
        
        if love.keyboard.isDown("b") then
            self.player:playAnimation("special")
        end
        
        if love.keyboard.isDown("n") then
            self.player:playAnimation("attack")
        end
        
        if love.keyboard.isDown("v") then
            self.player:playAnimation("idle")
        end
    end
    ]]--
end


function t:addEntity(entity)
    table.insert(self.layer.entities, entity)
end

return t