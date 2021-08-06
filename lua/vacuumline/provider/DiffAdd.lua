local backend = require('vacuumline.backend')

local function DiffAdd()
  return backend.get_diff_added()
end

return DiffAdd
