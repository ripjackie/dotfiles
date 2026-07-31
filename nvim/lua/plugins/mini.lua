local configs = {
  tabline = {},
  statusline = {},
  comment = {},
  bufremove = {
    silent = true
  },
  move = {},
  pairs = {},
  cursorword = {}
}

return {
  "nvim-mini/mini.nvim",
  config = function()
    for name, config in pairs(configs) do
      require("mini." .. name).setup(config)
    end
  end
}
