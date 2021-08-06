local backend = require('vacuumline.backend')

local function DiagnosticError()
  return backend.get_diagnostic_error()
end

return DiagnosticError
