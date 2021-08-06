local backend = require('vacuumline.backend')

local function DiffRemove()
  return backend.get_diff_removed()
end

return DiffRemove
