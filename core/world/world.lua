
local world = {}


function world:init()
    self.entities = {}
    self.area = {}
end


-- Save current world state to local file/db
function world:persist()
    -- TODO implement
end


-- Load world state from local file/db
function world:resist()
    -- TODO implement
end


function world:update(dt)
    self:updateEntities(dt)
    self:updateAreas(dt)
end


local function world:updateEntities(dt)
    for k,e in pairs(self.entities) do
	e:update(dt)
    end
end


local function world:updateAreas()
    for k,a in pairs(self.areas) do
	a:update(dt)
    end
end


return world

