
local t = {}

function t:

function t:serializeEntity(entity)
    
    return ""
end

-- TODO move this to IDL handler once it has been implemented
function t:serialize()
    local xm = e.state.xmove
    local ym = e.state.ymove
    if not xm then xm = "nil" end
    if not ym then ym = "nil" end
    return self.id.."#"..self.x.."#"..self.y.."#"..self.state.ani.."#"..self.state.dir.."#"..self.state.n.."#"..xm.."#"..ym
end


function