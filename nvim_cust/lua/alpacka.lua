---@class Plugin
---@field [1] string
---@field enabled boolean?
---@field event ( string | string[] )?
---@field ft ( string | string[] )?
---@field cmd ( string | string[] )?
---@field branch string?
---@field tag string?
---@field config function?


local alpackapath = vim.fn.stdpath("data") .. "/site/pack/alpacka"

---@param plugin Plugin
---@return boolean
local function is_installed(plugin)
  local plugin_path = alpackapath .. "/start/" .. vim.split(plugin[1], "/")[2]
  if vim.uv.fs_stat(plugin_path) then
    return true
  else
    return false
  end
end


---@param plugin Plugin
local function install(plugin)

end


---@param plugin Plugin
local function update(plugin)

end


---@param plugins Plugin[]?
local function setup(plugins)
  if not plugins then
    return
  end
  local installed_plugins = get_installed()

  for _, plugin in ipairs(plugins) do
    if is_installed(plugin) then
      install(plugin)
    else
      update(plugin)
    end
  end
end

local alpacka = {}

alpacka.setup = setup

return alpacka
