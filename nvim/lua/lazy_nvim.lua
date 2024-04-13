local uv = vim.uv or vim.loop

local lazypath = vim.fs.normalize(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  install = { colorscheme = { "sonokai", "habamax" } }
})
