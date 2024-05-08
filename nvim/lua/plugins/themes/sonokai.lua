return {
  "sainnhe/sonokai",
  lazy = true,
  priority = 1000,
  init = function ()
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_diagnostic_virtual_text = "colored"
    vim.g.sonokai_style = "maia"
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "sonokai",
      callback = function ()
        vim.cmd("highlight link TSParameter Purple")
        vim.cmd("highlight link TSParameterBuiltin PurpleItalic")
        vim.cmd("highlight link TSVariable Blue")
        vim.cmd("highlight link TSVariableBuiltin BlueItalic")
      end
    })
  end
}
