return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup {
      options = {
        style_preset = bufferline.style_preset.no_italic,
        diagnostics = "nvim_lsp",
        separator_style = "slant"
      }
    }
  end
}
