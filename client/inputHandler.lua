
local t = {}


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

function t:keypressed(t)
    if t == "w" then camera:up() end
    if t == "a" then camera:left() end
    if t == "s" then camera:down() end
    if t == "d" then camera:right() end
end

return t