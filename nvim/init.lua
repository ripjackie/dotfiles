local uv = vim.uv or vim.loop

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not uv.fs_stat(lazypath) then
  vim.system({
    "git", "clone", "--filter=none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  }):wait()
end
vim.opt.rtp:prepend(lazypath)

vim.g.mobile = true
vim.g.mapleader = " "
vim.g.sonokai_style = 'maia'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"

require("lazy").setup({
  { import = "plugins" },
}, {
  defaults = { lazy = true },
  install = { colorscheme = { "sonokai" } }
})

require("core")

vim.cmd.colorscheme("sonokai")
