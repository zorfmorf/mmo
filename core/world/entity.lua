-- All players, npcs, items, traps, ... are entities

Entity = Class {
    init = function(self, pos)
	self.pos = pos
    end
}


function Entity:update(dt)
    -- TODO implement
end


function Entity:draw()
    
end


