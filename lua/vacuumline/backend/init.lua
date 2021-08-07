--[[
Allow vacuumline to use either galaxyline or lualine as a backend
--]]

local M = {}

function M.init(backend)
  if backend == 'galaxyline' then
    return require('vacuumline.backend.galaxyline')
  elseif backend == 'lualine' then
    return require('vacuumline.backend.lualine')
  else
    -- TODO: error
  end
end

return M

