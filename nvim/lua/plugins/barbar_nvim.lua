return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim"
  },
  version = "^1.0.0",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {}
}
