-- libraries
Class = require "lib.hump.class" 
enet = require "enet"

-- imports
require "misc.constants"
require "misc.util"
log = require "misc.log"
texHandler = require "draw.texHandler"
camera = require "draw.camera"
drawHandler = require "draw.drawHandler"
require "world.world"

-- vars
local host = nil
local server = nil
local world = nil


function love.load()
    -- TODO debug
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    host = enet.host_create()
    server = host:connect("localhost:25896")
    camera:init()
    camera:focus(5, 5)
    texHandler:init()
    world = World()
end


function love.update(dt)
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
    drawHandler:draw(world)
end


function love.keypressed(key)
    if key == "left" then camera:left() end
    if key == "up" then camera:up() end
    if key == "down" then camera:down() end
    if key == "right" then camera:right() end
end
