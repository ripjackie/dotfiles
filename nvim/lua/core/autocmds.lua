local opt = vim.opt

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "lua,c",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end
})
