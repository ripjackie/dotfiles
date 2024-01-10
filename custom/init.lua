local vim = vim
local opt = vim.opt

---------- Opts ----------
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

---------- User Commands ------------
vim.api.nvim_create_user_command("MasonSync", function()
  local registry = require("mason-registry")
  local installed_pkgs = registry.get_installed_package_names()
  local ensured_pkgs = require("custom.configs.mason").opts.ensure_installed
  local to_install = {}
  local to_uninstall = {}

  vim.schedule(function()
    vim.notify("[MasonSync] Syncing Mason Binaries", vim.log.levels.INFO)
  end)

  for _, name in ipairs(ensured_pkgs) do
    if not vim.list_contains(installed_pkgs, name) then
      local pkg = registry.get_package(name)

      vim.schedule(function()
        vim.notify(string.format("[MasonSync] Installing %s", pkg.name), vim.log.levels.INFO)
      end)

      pkg:once(
        "install:success",
        vim.schedule_wrap(function()
          vim.notify(string.format("[MasonSync] Successfully Installed %s", pkg.name), vim.log.levels.INFO)
        end)
      )
      pkg:install()
    end
  end

  for _, name in ipairs(installed_pkgs) do
    if not vim.list_contains(ensured_pkgs, name) then
      local pkg = registry.get_package(name)

      vim.schedule(function()
        vim.notify(string.format("[MasonSync] Uninstalling %s", pkg.name), vim.log.levels.INFO)
      end)

      pkg:once(
        "uninstall:success",
        vim.schedule_wrap(function()
          vim.notify(string.format("[MasonSync] Successfully Uninstalled %s", pkg.name), vim.log.levels.INFO)
        end)
      )
      pkg:uninstall()
    end
  end

  vim.schedule(function()
    vim.notify("[MasonSync] Synced Mason Binaries", vim.log.levels.INFO)
  end)
end, {})

----------- AutoCmds -----------------
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    opt.shiftwidth = 2
    opt.tabstop = 2
    opt.softtabstop = 2
  end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   command = "MasonSync",
-- })
