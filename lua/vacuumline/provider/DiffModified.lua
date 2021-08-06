local backend = require('vacuumline.backend')

local function DiffModified()
  return backend.get_diff_modified()
end

return DiffModified
