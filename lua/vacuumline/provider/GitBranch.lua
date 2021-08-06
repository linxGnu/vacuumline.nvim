local backend = require('vacuumline.backend')

local function GitBranch()
  return backend.get_git_branch()
end

return GitBranch
