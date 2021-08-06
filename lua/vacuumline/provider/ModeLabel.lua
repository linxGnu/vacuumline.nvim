local vim = vim

local function ModeLabel(mode_map)
  return function()
    -- TODO: terminal modes [term>normal]
    local mode_config = mode_map[vim.fn.mode()]
    local mode_label = mode_config and mode_config.label or ' '

    return mode_label
  end
end

return ModeLabel
