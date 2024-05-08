return {
  "sainnhe/sonokai",
  init = function()
    vim.g.sonokai_style = "maia"
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_diagnostic_virtual_text = "colored"
  end,
  config = function()
    vim.cmd.colorscheme("sonokai")
  end
}
