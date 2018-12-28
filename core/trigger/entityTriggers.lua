
local et = {}

-- placeholder/example implementation
function et:ability(id, name)
    if entityHandler[id] then
        entityHandler[id][name]()
    end
end


return et
