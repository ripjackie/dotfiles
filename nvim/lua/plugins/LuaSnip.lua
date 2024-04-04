return {
  "L3MON4D3/LuaSnip",
  event = "LspAttach",
  dependencies = {
    "rafamadriz/friendly-snippets"
  },
  config = function()
    require("config.luasnip")
  end
}
