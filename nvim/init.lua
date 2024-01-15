local function bootstrap_lazy()
  local lazypath = string.format("%s/lazy/lazy.nvim", vim.fn.stdpath("data"))
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git", "clone", "--filter=blob:none", "--branch=stable",
      "https://github.com/folke/lazy.nvim.git",
      lazypath
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

bootstrap_lazy()

vim.opt.termguicolors = true
vim.g.mapleader = " "

require("opts")

require("lazy").setup(
  require("plugins"),
  {
    defaults = { lazy = true }
  }
)

require("theme")
require("mappings")
