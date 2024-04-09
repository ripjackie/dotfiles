local uv = vim.uv or vim.loop

local lazypath = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "lazy", "lazy.nvim")
if not uv.fs_stat(lazypath) then
  vim.system({
    "git", "clone",
    "--filter=none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  }, { text = true }):wait()
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  defaults = { lazy = true },
  install = { colorscheme = { "sonokai", "habamax" } }
})
