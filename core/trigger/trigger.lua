local entityTriggers = require "core.trigger.entityTriggers"

-- Triggers separate network logic/input logic from gamelogic
-- Triggers are called by network messages and/or input events


local trigger = {}


-- Add all contents of given table to this table
function trigger:merge(nt)
    for k,v in pairs(nt) do
        if trigger.k then 
            log:debug("trigger: overwriting method", k)
        end
        trigger[k] = v
    end
end


-- Merge all other triggers into this one
function trigger:init()
    self:merge(entityTriggers)
end


return trigger
