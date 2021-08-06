local backend = require('vacuumline.backend')

local function FileSize()
  return backend.get_file_size()
end

return FileSize
