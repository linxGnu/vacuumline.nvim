local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local lspclient = require('galaxyline.provider_lsp')
local extension = require('galaxyline.provider_extensions')

local M = {
  get_diagnostic_error = diagnostic.get_diagnostic_error,
  get_diagnostic_warn = diagnostic.get_diagnostic_warn,
  get_diagnostic_hint = diagnostic.get_diagnostic_hint,
  get_diagnostic_info = diagnostic.get_diagnostic_info,
  get_diff_added = vcs.diff_add,
  get_diff_modified = vcs.diff_modified,
  get_diff_removed = vcs.diff_remove,
  get_git_branch = vcs.get_git_branch,
  get_file_format = fileinfo.get_file_format,
  get_file_icon = fileinfo.get_file_icon,
  get_file_name = fileinfo.get_current_file_name,
  get_file_size = fileinfo.get_file_size,
  get_filetype_color = fileinfo.get_file_icon_color,
  get_line_column = fileinfo.line_column,
  get_line_percent = fileinfo.current_line_percent,
  get_lsp_client = lspclient.get_lsp_client,
  get_scrollbar = extension.scrollbar_instance
}

return M
