local vim = vim

require("themery").setup({
  themes = require("themes"),
  themeConfigFile = vim.fn.stdpath("config") .. "/plugin/theme.lua",
  livePreview = true
})
