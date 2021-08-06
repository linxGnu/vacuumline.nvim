local backend = require('vacuumline.backend')

function LineColumn()
  return backend.get_line_column()
end

return LineColumn
