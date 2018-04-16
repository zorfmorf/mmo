
Player = Class{__includes = Entity}


function Player:init(id, x, y)
    self.id = id
    Entity.init(self, x, y)
end
