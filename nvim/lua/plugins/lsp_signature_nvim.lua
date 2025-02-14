return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  opts = {},
  keys = {
    { "<C-s>", function() require('lsp_signature').toggle_float_win() end, mode = 'i', desc = "Lsp Signature" }
  }
}
