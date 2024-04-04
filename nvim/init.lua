local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.themes" }
}, {
  defaults = {
    lazy = true
  },
  install = {
    colorscheme = { "everforest" }
  }
})
