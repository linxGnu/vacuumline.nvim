 backend = require('vacuumline.backend')

local function DiagnosticHint()
  return backend.get_diagnostic_hint()
end

return DiagnosticHint
