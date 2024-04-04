local vim = vim
local opt = vim.opt
local api = vim.api

api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    opt.relativenumber = false
    opt.number = true
    opt.signcolumn = "yes"
  end
})

api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    opt.relativenumber = true
  end
})
