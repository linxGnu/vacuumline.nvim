local M = {}

local lualine_opts = {
  --[[ options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },--]]
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.fg, bg = colors.bg}}
    }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  },
  extensions = {}
}

-- adapt segment from internal format to lualine format
local function adapt_segment(segment)
  local adapted = {}
  for _, section in ipairs(segment) do
    table.insert(adapted, {
      section.provider,
      -- TODO
    })
  end

  return adapted
end

function M.create_builder(config, side)
  local builder = {}

  local function insert_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function insert_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  function builder.add_segments(segments, side)
    local insert = side == 'left' and insert_left or insert_right

    for _, isegment in ipairs(segments) do
      local segment = adapt_segment(isegment)

      insert(segment)
    end
  end

  return builder
end

return M
