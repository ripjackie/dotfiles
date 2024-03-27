return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
    {
      "jay-babu/mason-null-ls.nvim",
      opts = { automatic_installation = true }
    }
  },
  opts = function()
    local null_ls = require("null-ls")
    return {
      sources = {
        null_ls.builtins.diagnostics.selene
      }
    }
  end
}
