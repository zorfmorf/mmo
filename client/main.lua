-- libraries
enet = require "enet"
Class = require "lib.hump.class"
sti = require "lib.sti"

-- imports
require "core.util.constants"
require "core.util.util"
log = require "core.util.log"
local network = require "lib.hold.network"
local trigger = require "core.trigger.trigger"

function love.load()
    -- TODO debug
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    network:init("localhost", 25896, nil)
    network:connect()
    trigger:init()
end


function love.update(dt)
    network:read_inputs(dt)
end


function love.draw()
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print(love.timer.getFPS(), 5, 5)
end


function love.keypressed(key)

end


function love.resize(w, h)


function love.quit()
    network:disconnect()
    return false
end

