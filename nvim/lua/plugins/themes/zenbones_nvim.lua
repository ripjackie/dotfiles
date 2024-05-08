return {
  "mcchrish/zenbones.nvim",
  init = function ()
    vim.g.forestbones = {
      darkness = "warm",
      darken_noncurrent_window = true,
      colorize_diagnostic_underline_text = true,
      transparent_background = true
    }
  end,
  dependencies = {
    "rktjmp/lush.nvim"
  }
}
