-- libraries
Class = require "lib.hump.class" 
enet = require "enet"

-- imports
require "misc.constants"
require "misc.util"
log = require "misc.log"
texHandler = require "draw.texHandler"
camera = require "draw.camera"
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
    love.graphics.scale(TEXTURE_SCALING, TEXTURE_SCALING)
    camera:apply()
    
    love.graphics.setColor(255, 255, 255)
    local chunk = world:get(0, 0)
    for i=1,WORLD_CHUNK_SIZE do
        for j=1,WORLD_CHUNK_SIZE do
            local quad = chunk[i - 1][j - 1]
            if quad then
                local atlas = texHandler.tex.atlas[quad.atlas]
                local x = math.floor(0 + (i - 1) * atlas.x)
                local y = math.floor(0 + (j - 1) * atlas.y)
                love.graphics.draw(atlas.tex, quad.quad, x, y)
            end
        end
    end
    
    love.graphics.origin()
    love.graphics.setColor(200, 100, 100)
    love.graphics.circle("fill", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 10)
end
