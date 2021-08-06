local backend = require('vacuumline.backend')

local function FileTypeColor()
  return backend.get_filetype_color()
end

return FileTypeColor
