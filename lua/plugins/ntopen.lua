local M = {}

M.openinneotree = function()
  require("neo-tree.command").execute({
    source = "filesystem",
    action = "focus",
    reveal = true,
  })
end

return M
