return {
  "sainnhe/everforest",
  lazy = true,
  priority = 1000,
  init = function ()
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_diagnostic_virtual_text = "colored"
    vim.g.everforest_better_performance = 1
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "everforest",
      callback = function ()
        vim.cmd("highlight link TSParameter Purple")
        vim.cmd("highlight link TSParameterBuiltin PurpleItalic")
        vim.cmd("highlight link TSVariable Blue")
        vim.cmd("highlight link TSVariableBuiltin BlueItalic")
      end
    })
  end
}
