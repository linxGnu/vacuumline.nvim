 backend = require('vacuumline.backend')

local function DiagnosticInfo()
  return backend.get_diagnostic_info()
end

return DiagnosticInfo
