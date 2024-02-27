---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'everforest',
  extended_integrations = { "hop" }
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
