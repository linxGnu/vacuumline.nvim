local backend = require('vacuumline.backend')

local function DiagnosticWarn()
  return backend.get_diagnostic_warn()
end

return DiagnosticWarn
