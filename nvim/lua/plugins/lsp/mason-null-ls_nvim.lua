return {
  "jay-babu/mason-null-ls.nvim",
  cond = not vim.g.mobile,
  event = "LspAttach",
  dependencies = {
    "williamboman/mason.nvim"
  },
  opts = {
    automatic_installation = true
  }
}
