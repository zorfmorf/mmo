-- libraries
Class = require "core.lib.hump.class" 
enet = require "enet"

-- imports
require "core.misc.constants"
require "core.misc.util"
log = require "core.misc.log"
texHandler = require "client.draw.texHandler"
camera = require "client.draw.camera"
drawHandler = require "client.draw.drawHandler"
require "core.world.world"
require "core.world.sprite"

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
    
    if EDITOR_MODE then
        editor = require "client.editor.editor"
        editor:init()
    end
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
    
    if EDITOR_MODE then editor:update(dt) end
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
