local vim = vim

local function ModeIndicator(section_label, mode_map)
  return function()
    local mode_config = mode_map[vim.fn.mode()]
    local mode_background = mode_config and mode_config.background or '#ff0000'

    -- FIXME
    vim.api.nvim_command("hi " .. section_label .. " guifg=" .. mode_background)
    return '▋'
  end
end

return ModeIndicator
