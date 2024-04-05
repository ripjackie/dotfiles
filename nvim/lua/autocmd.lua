local vim = vim
local opt = vim.opt
local au = require("nx.au")

au({
  {
    "InsertEnter",
    callback = function()
      opt.relativenumber = false
    end
  },
  {
    "InsertLeave",
    callback = function()
      opt.relativenumber = true
    end
  },
})
