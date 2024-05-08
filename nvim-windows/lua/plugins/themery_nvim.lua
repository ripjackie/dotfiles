return {
  "zaldih/themery.nvim",
  dependencies = {
    "sainnhe/everforest",
    "comfysage/evergarden"
  },
  opts = {
    livePreview = true,
    themeConfigFile = vim.fn.stdpath("config") .. "/lua/core/theme.lua",
    themes = require("plugins.configs.themery")
  }
}
