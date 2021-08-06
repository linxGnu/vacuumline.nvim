local ModeIndicator = require('vacuumline.provider.ModeIndicator')
local ModeLabel = require('vacuumline.provider.ModeLabel')
local condition = require('galaxyline.condition')
local vim = vim

local function generate(opts, mode)
  local segment = opts.segments
  local color = opts.colors
  local config = segment.mode
  local next = segment[config.next]
  local mode_map = config.map

  local ModeIndicatorKey = 'ModeIndicator_' .. mode
  local ModeLabelKey = 'ModeLabel' .. mode

  local galaxy_label = 'Galaxy' .. ModeIndicatorKey

  local Mode = {
    {
      [ModeIndicatorKey] = {
        provider = ModeIndicator(galaxy_label, mode_map),
        highlight = {config.background, config.background}
      }
    },
    {
      [ModeLabelKey] = {
        provider = ModeLabel(mode_map),
        highlight = {config.foreground, config.background, 'bold'},
        separator = config.separator,
        separator_highlight = {config.background, function() -- TODO: add ability to see if next segment is active
          if condition.buffer_not_empty() then
            return next.background
          end
          return color.background.line
        end}
      }
    }
  }

  return Mode
end

return generate

