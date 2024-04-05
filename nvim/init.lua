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
vim.opt.background = "dark"
vim.g.sonokai_style = 'maia'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"


require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.themes" }
}, {
    defaults = {
        lazy = true
    },
    install = {
        colorscheme = { "sonokai" }
    }
})
vim.cmd.colorscheme("sonokai")

require("opt")
require("autocmd")
require("keymap")
require("highlight")
