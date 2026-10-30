
---@class SpecTable
---@field [1] string repo
---@field src string? also repo
---@field name string? pack name
---@field config function? config function to run
---@field event (string | string[])? what event to attach config to
---@field version (string | vim.VersionRange)? vim version string / range
---@field build (string | function)? packchanged command to run

---@alias PluginSpec SpecTable | string

local configs = {}
local packspecs = {}
local events = {}
local builds = {}

local pack_group = vim.api.nvim_create_augroup("PackaAuGroup", { clear = true })

---@param pspec PluginSpec
---@return PluginSpec
local function sanitize(pspec)
  local spec = pspec
  if type(spec) == "string" then
    spec = { spec }
  end

  if spec[1] then
    spec.src = spec[1]
    spec[1] = nil
  end

  if spec.src:match('^[%w-._]+/[%w-._]+$') then
    spec.src = "https://github.com/" .. spec.src
  end

  if spec.version and type(spec.version) == "string" then
    spec.version = vim.version.range(spec.version --[[@as string]])
  end

  return spec
end

---@param pspec PluginSpec
---@return PluginSpec
local function handleEvent(pspec)
  local spec = pspec
  if type(spec.event) == "string" then
    spec.event = { spec.event --[[@as string]] }
  end

  for _, event in ipairs(spec.event --[[@as (string[])]]) do
    if not events[event] then
      events[event] = {}
    end
    table.insert(events[event], spec.config)
  end

  spec.config = nil
  spec.event = nil

  return spec
end

---@param pspec PluginSpec
---@return PluginSpec
local function handleConfig(pspec)
  local spec = pspec
  table.insert(configs, spec.config)
  spec.config = nil
  return spec
end

---@param buildspecs { [string]: string | function }
local function runBuilds(buildspecs)
  vim.api.nvim_create_autocmd("PackChanged", {
    group = pack_group,
    callback = function(event)
      local name, kind = event.data.spec.name, event.data.kind
      if kind ~= "install" and kind ~= "update" then return end
      if not buildspecs[name] then return end

      if type(buildspecs[name]) == "string" then
        vim.print(("Building '%s', running command '%s'"):format(name, buildspecs[name]))
        vim.system({ buildspecs[name] --[[@as string]] }, { cwd = event.data.path }, function(result)
          if result.code == 0 then
            vim.print(string.format("Building '%s' succeeded.", name))
          else
            vim.print(string.format("Building '%s' failed, output: %s", name, result.stderr))
          end
        end)
      elseif type(buildspecs[name]) == "function" then
        vim.print(("Building '%s', funning build func"):format(name))
        builds[name]()
      else
        vim.print(("Error Building '%s': type '%s' not valid"):format(name, type(buildspecs[name])))
      end
    end
  })
end

---@param eventspecs { [string]: function[] }
local function runEvents(eventspecs)
  for event, event_configs in pairs(eventspecs) do
    vim.api.nvim_create_autocmd(event, {
      group = pack_group,
      callback = function()
        for _, config in ipairs(event_configs) do
          config()
        end
      end
    })
  end
end
---@param configspecs function[]
local function runConfigs(configspecs)
  if not configspecs then return end
  for _, config in ipairs(configspecs) do
    config()
  end

end

---@param pspec PluginSpec
---@return PluginSpec
local function handleBuild(pspec)
  local spec = pspec
  local name = spec.src:match("[%w-._]+$")
  builds[name] = spec.build
  spec.build = nil
  return spec
end

local M = {}

---@param specs PluginSpec[]?
function M.setup(specs)
  if not specs then return end
  for _, spec in ipairs(specs) do
    spec = sanitize(spec)

    if spec.config and type(spec.config) == "function" then
      if spec.event then
        spec = handleEvent(spec)
      else
        spec = handleConfig(spec)
      end
    end

    if spec.build then
      spec = handleBuild(spec)
    end

    table.insert(packspecs, spec)

  end

  if builds ~= nil then runBuilds(builds) end

  vim.pack.add(packspecs)

  if events ~= nil then runEvents(events) end

  if configs ~= nil then runConfigs(configs) end
end

return M
