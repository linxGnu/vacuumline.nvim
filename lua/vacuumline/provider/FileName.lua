local backend = require('vacuumline.backend')

local function FileName()
  return backend.get_file_name()
end

return FileName
