-- libraries
enet = require "enet"
Class = require "core.lib.hump.class"
sti = require "core.lib.sti"

-- imports
require "core.misc.constants"
require "core.misc.util"
log = require "core.misc.log"
require "core.world.entity"
require "core.world.player"
camera = require "client.camera"
objectHandler = require "core.game.objectHandler"
animationHandler = require "core.game.animationHandler"
networkHandler = require "client.networkHandler"

-- vars
local host = nil
local server = nil
local map = nil


function love.load()
    -- TODO debug
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    camera:init()
    map = sti("core/map/overworld.lua")
    objectHandler:init(map)
    animationHandler:init()
    networkHandler:init()
end


function love.update(dt)
    camera:focus(map, objectHandler.layer.entities[1])
    
    map:update(dt)
    objectHandler:update(dt)
    networkHandler:read_inputs(dt)
end


function love.draw()
    love.graphics.setColor(255, 255, 255, 255)
    local tx, ty = camera:apply()
    map:draw(tx, ty, TEXTURE_SCALING, TEXTURE_SCALING)
    love.graphics.print(love.timer.getFPS(), 5, 5)
end


function love.keypressed(key)
    
end


function love.resize(w, h)
	map:resize(w, h)
end
