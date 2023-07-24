local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if not vim.g.vscode then
    require("plugins")
    require("configs")
    require("keymaps")
    require("lspconfigs")
    require("evil_lualine")

end

vim.cmd[[autocmd VimEnter * :COQnow -s]]
