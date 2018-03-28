-- libraries
Class = require "lib.hump.class" 
enet = require "enet"

-- imports
require "misc.constants"
require "misc.util"
log = require "misc.log"
texHandler = require "draw.texHandler"
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
    love.graphics.scale( 3, 3 )
    local chunk = world:get(0, 0)
    for i=1,WORLD_CHUNK_SIZE do
        for j=1,WORLD_CHUNK_SIZE do
            local quad = chunk[i - 1][j - 1]
            if quad then
                love.graphics.draw(texHandler.tex.atlas[quad[1]].tex, quad[2], 0 + (i - 1) * WORLD_CHUNK_SIZE, 0 + (j - 1) * WORLD_CHUNK_SIZE)
            end
        end
    end
    love.graphics.print('Hello World!', 400, 300)
end
