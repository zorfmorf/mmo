
-- spoof love graphics module
love = {}
love.graphics = {}
love.graphics.isCreated = false
love.filesystem = {}
love.filesystem.load = function(path) return loadfile(path) end
love.data = {}
