---@class Plugin
---@field [1] string
---@field enabled boolean?
---@field event ( string | string[] )?
---@field ft ( string | string[] )?
---@field cmd ( string | string[] )?
---@field branch string?
---@field tag string?
---@field config function?


local packa_path = vim.fn.stdpath("data") .. "/site/pack/packa"

---@param plugin Plugin
local function is_installed(plugin)
  local plugin_path = packa_path .. "/start/" .. vim.split(plugin[1], "/")[2]
  return vim.uv.fs_stat(plugin_path) ~= nil
end

---@param plugins Plugin[]?
local function setup(plugins)
  if not plugins then return end

  for _, plugin in pairs(plugins) do
    if is_installed(plugin) then
      update(plugin)
    else
      install(plugin)
    end
  end
end

local packa = {}

packa.setup = setup

return packa
