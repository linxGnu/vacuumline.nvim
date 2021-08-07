local M = {}

local lualine_opts = {
  options = {
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
