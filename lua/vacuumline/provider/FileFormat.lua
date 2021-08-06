local backend = require('vacuumline.backend')

local function FileFormat()
  return backend.get_file_format()
end

return FileFormat
