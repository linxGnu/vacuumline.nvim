local backend = require('vacuumline.backend')

local function LinePercent()
  return backend.get_line_percent()
end

return LinePercent
