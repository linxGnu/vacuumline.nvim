local backend = require('vacuumline.backend')

local function FileIcon()
  return backend.get_file_icon()
end

return FileIcon
