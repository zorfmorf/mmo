-- libraries
enet = require "enet"
Class = require "core.lib.hump.class"
sti = require "core.lib.sti"

-- imports
require "core.misc.constants"
require "core.misc.util"
log = require "core.misc.log"
require "core.world.world"
require "core.world.sprite"
camera = require "client.camera"

-- vars
local host = nil
local server = nil
local world = nil

local map = nil


function love.load()
    -- TODO debug
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    host = enet.host_create()
    server = host:connect("localhost:25896")
    camera:init()
    camera:focus(27, 27)
    map = sti("core/map/overworld.lua")
end


function love.update(dt)
    map:update(dt)
    
    -- placeholder network code
    --local event = host:service()
    while event do
        if event.type == "receive" then
            print("Got message: ", event.data, event.peer)
            event.peer:send( "ping" )
        elseif event.type == "connect" then
            print(event.peer, "connected.")
            event.peer:send( "ping" )
        elseif event.type == "disconnect" then
            print(event.peer, "disconnected.")
        end
        event = host:service()
    end
end


function love.draw()
    --local now = love.timer.getTime()
    love.graphics.setColor(255, 255, 255, 255)
    local tx, ty = camera:apply()
    
    map:draw(tx, ty, TEXTURE_SCALING, TEXTURE_SCALING)

    love.graphics.print(love.timer.getFPS(), 5, 5)
    
    
    --log:debug("drawtime: ", tostring(love.timer.getTime() - now))
end


function love.keypressed(key)
    if key == "left" then camera:left() end
    if key == "up" then camera:up() end
    if key == "down" then camera:down() end
    if key == "right" then camera:right() end
end


function love.resize(w, h)
	map:resize(w, h)
end
