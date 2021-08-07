local backend = require('vacuumline.backend')
local builder = require('vacuumline.builder')

local M = {}

gl.short_line_list = {'LuaTree', 'vista', 'dbui'}

function M.setup(opts)
  local api = backend.init(opts.backend or 'galaxyline')
  return builder.build(api, opts)
end

return M
