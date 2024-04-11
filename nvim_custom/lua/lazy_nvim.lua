local uv = vim.uv or vim.loop

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not uv.fs_stat(lazypath) then
  vim.system({
    "git", "clone",
    "--filter=none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  }):wait()
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  import = "plugins"
}, {
  defaults = {
    lazy = true
  },
  install = {
    colorscheme = { "sonokai", "habamax" }
  }
})
