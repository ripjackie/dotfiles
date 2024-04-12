local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local grp = augroup("CustomGroup", { clear = true })

autocmd("InsertEnter", {
  group = grp,
  callback = function()
    vim.wo.relativenumber = false
  end
})

autocmd("InsertLeave", {
  group = grp,
  callback = function()
    vim.wo.relativenumber = true
  end
})

autocmd("FileType", {
  group = grp,
  pattern = "lua",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end
})
