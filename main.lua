-- libraries
enet = require "enet"
Class = require "core.lib.hump.class"
sti = require "core.lib.sti"

-- imports
require "core.misc.constants"
require "core.misc.util"
log = require "core.misc.log"
require "core.world.entity"
camera = require "client.camera"
objectHandler = require "client.objectHandler"

-- vars
local host = nil
local server = nil

local map = nil


function love.load()
    -- TODO debug
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    host = enet.host_create()
    server = host:connect("localhost:25896")
    camera:init()
    camera:focus(27, 27)
    map = sti("core/map/overworld.lua")
    objectHandler:init(map)
    
end


function love.update(dt)
    map:update(dt)
    
    -- placeholder network code
    local event = host:service()
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
