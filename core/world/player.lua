
Player = Class{__includes = Entity}


function Player:init(id, index, x, y)
    Entity.init(self, x, y)
    self.id = id
    self.index = index
end
