local vim = vim
local nx = { set = require("nx.set") }

if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

nx.set({
  clipboard = "unnamedplus",
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smarttab = true,
  autoindent = true,
  splitbelow = true,
  splitright = true,
  showmode = false,
  wrap = false,
  signcolumn = "yes:1",
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  numberwidth = 3,
  relativenumber = true,
  number = true,
  showmatch = true,
  undofile = true,
  undodir = vim.fn.stdpath("data") .. "/undofile",
  swapfile = false,
  scrolloff = 8,
  sidescrolloff = 8
}, vim.opt)
