return {
  "jinzhongjia/LspUI.nvim",
  cond = function()
    if vim.fn.has("nvim-0.10") == 1 then
      return true
    else
      return false
    end
  end,
  event = "LspAttach",
  opts = {}
}
