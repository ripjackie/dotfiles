local vim = vim
local opt = vim.opt

---------- Opts ----------
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

----------- AutoCmds -----------------
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    opt.shiftwidth = 2
    opt.tabstop = 2
    opt.softtabstop = 2
  end,
})
