-- libraries
enet = require "enet"
Class = require "lib.hump.class"
sti = require "lib.sti"

-- imports
require "core.util.constants"
log = require "core.util.log"
require "core.util.util"
--require "core.world.entity"
--require "core.world.player"
--camera = require "client.camera"
--objectHandler = require "core.game.objectHandler"
--animationHandler = require "core.game.animationHandler"
local clientConnector = require "network.clientConnector"
local trigger = require "core.trigger.trigger"
--serializer = require "core.serialization.serializer"
--inputHandler = require "client.inputHandler"

-- vars
local host = nil
local server = nil
local map = nil


function love.load()
    -- TODO debug
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    --camera:init()
    --map = sti("core/map/overworld.lua")
    --objectHandler:init(map, animationHandler)
    --animationHandler:init()
    clientConnector:init()
    trigger:init()
    --serializer:init(objectHandler)
end


function love.update(dt)
    --camera:focus(map, objectHandler.layer.entities[1])
    
    --map:update(dt)
    --objectHandler:update(dt)
    clientConnector:read_inputs(dt)
end


function love.draw()
    love.graphics.setColor(255, 255, 255, 255)
    --local tx, ty = camera:apply()
    --map:draw(tx, ty, TEXTURE_SCALING, TEXTURE_SCALING)
    love.graphics.print(love.timer.getFPS(), 5, 5)
end


function love.keypressed(key)
    --inputHandler:keypressed(key)
end


function love.resize(w, h)
	--map:resize(w, h)
end


function love.quit()
    clientConnector:disconnect()
    return false
end
