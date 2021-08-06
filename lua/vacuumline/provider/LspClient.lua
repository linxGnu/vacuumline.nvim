local backend = require('vacuumline.backend')

local function LspClient()
  return backend.get_lsp_client()
end

return LspClient
