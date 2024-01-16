local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)


vim.opt.termguicolors = true
vim.g.mapleader = " "

require("lazy").setup(
  require("plugins"),
  {
    defaults = { lazy = true }
  }
)
