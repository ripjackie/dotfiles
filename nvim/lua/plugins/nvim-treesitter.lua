return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  dependencies = {
    "RRethy/nvim-treesitter-endwise"
  },
  build = ":TSUpdate",
  config = function()
    require("plugins.configs.treesitter")
  end
}
