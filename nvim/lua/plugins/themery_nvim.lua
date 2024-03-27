return {
  "zaldih/themery.nvim",
  dependencies = {
    "sainnhe/everforest"
  },
  opts = {
    themes = require("themes"),
    themeConfigFile = "~/.config/nvim/lua/theme.lua",
    livePreview = true
  }
}
