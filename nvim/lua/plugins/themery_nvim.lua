return {
  "zaldih/themery.nvim",
  priority = 1000,
  opts = {
    themes = require("plugins.configs.themery"),
    themeConfigFile = vim.fn.stdpath("config") .. "/lua/core/theme.lua",
    livePreview = true
  }
}
