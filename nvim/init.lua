-- bootstrap lazy.nvim
if not vim.g.vscode then
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    print("Loading Lazy.nvim...")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
    print("Done.")
  end
  vim.opt.rtp:prepend(lazypath)
  
  -- load plugins
  require("plugins")
  
  -- load configurations
  require("configurations")
  
  -- setup nvim-cmp
  require("nvim_cmp")
  
  -- setup lspconfig
  require("nvim_lspconfig")
  
  vim.cmd("colorscheme tokyonight")
end
