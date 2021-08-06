local backend = require('vacuumline.backend')

local function ScrollBar()
  return backend.get_scrollbar()
end

return ScrollBar
