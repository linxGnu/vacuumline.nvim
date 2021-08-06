local SearchResults = require('vacuumline.provider.SearchResults')
local condition = require('vacuumline.condition')

local vim = vim

local function generate(opts, mode)
  local segment = opts.segments
  local config = segment.search
  local next = segment[config.next]

  local SearchResultsKey = 'SearchResults_' .. mode

  local Search = {
    {
      [SearchResultsKey] = {
        provider = SearchResults,
        condition = condition.standard,
        highlight = {config.foreground, config.background},
        separator = config.separator,
        separator_highlight = {config.background, next.background}
      }
    }
  }

  return Search
end

return generate
