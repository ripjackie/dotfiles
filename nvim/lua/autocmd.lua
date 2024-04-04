local vim = vim
local opt = vim.opt
local nx = { au = require("nx.au") }

nx.au({
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
