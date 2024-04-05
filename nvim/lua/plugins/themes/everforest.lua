local vim = vim
return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  init = function()
    vim.opt.background = "dark"
    vim.g.everforest_better_performance = 1
    vim.g.everforest_background = "soft"
  end,
}
