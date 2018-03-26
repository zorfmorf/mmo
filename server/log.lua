local log = {}

-- supported log levels
LOG_INFO = 1
LOG_WARN = 2
LOG_ERROR = 3

-- log level strings
local LOG_STR = {}
LOG_STR[LOG_INFO] = "INFO"
LOG_STR[LOG_WARN] = "WARN"
LOG_STR[LOG_ERROR] = "ERROR"


-- set default log level
LOG_LEVEL = LOG_ERROR


-- log with level
function log:log(level, ...)
    -- TODO keep in memory and dump periodically / on demand
    print(LOG_STR[level], ...)
end


function log:info(...)
    if LOG_LEVEL == LOG_INFO then self:log(LOG_INFO, ...) end
end


function log:warn(...)
    if LOG_LEVEL > LOG_INFO then self:log(LOG_WARN, ...) end
end


function log:err(...)
    if LOG_LEVEL > LOG_WARN then self:log(LOG_ERROR, ...) end
end

return log