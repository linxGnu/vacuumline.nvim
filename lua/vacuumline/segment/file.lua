local condition = require("vacuumline.condition")
local fileinfo = require("galaxyline.providers.fileinfo")
local vim = vim

local format_hide_width = 45

local function generate(opts, mode)
	local segment = opts.segments
	local color = opts.colors
	local config = segment.file
	local next = segment[config.next]

	local short_highlight = { color.foreground.line, color.background.line }

	local FileIconKey = "FileIcon_" .. mode
	local FileNameKey = "FileName_" .. mode
	local FileEndKey = "FileEnd_" .. mode

	local File = {
		{
			[FileIconKey] = {
				provider = "FileIcon",
				condition = condition.standard_not_empty,
				highlight = mode == "short" and short_highlight or { fileinfo.get_file_icon_color, config.background },
			},
		},
		{
			[FileNameKey] = {
				provider = function()
					local name = fileinfo.get_current_file_name()
					local size = fileinfo.get_file_size()

					if mode ~= "short" and not condition.hide_in_width() then -- truncated filename
						local len = string.len(name)
						local n_chars = math.ceil(vim.fn.winwidth(0) / 8) + 1
						local str_start = (len - n_chars) >= 1 and (len - n_chars) or 1
						local ellipses = str_start > 1 and "..." or ""

						return ellipses .. string.sub(name, str_start)
					end
					return name .. size
				end,
				condition = condition.gen_standard_not_empty(format_hide_width),
				highlight = mode == "short" and short_highlight or { config.foreground, config.background },
			},
		},
		{
			[FileEndKey] = {
				provider = function() end,
				condition = condition.standard_not_empty,
				separator = mode ~= "short" and config.separator,
				separator_highlight = { config.background, next.background },
			},
		},
	}

	return File
end

return generate
