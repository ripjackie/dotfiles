---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everforest",
  statusline = {
    seperator_style = "round",
  },
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
