---@class Package
---@field opt boolean
---@field event (string | string[])?
---@field ft (string | string[])?
---@field cmd (string | string[])?
---@field config function?

local paqa = {}

local meta = {}

---@param packages Package[]?
function meta:__call(packages)
  if not packages then return end

  local paqs = {}

  local augroup = vim.api.nvim_create_augroup("PaqaConfigGroup", { clear = true })

  for _, package in ipairs(packages) do
    table.insert(paqs, package)
    if type(package) ~= "string" and package.config then
      if package.opt then
        if package.event then
          vim.api.nvim_create_autocmd(package.event, {
            group = augroup,
            callback = package.config
          })
        elseif package.ft then
          local ft
          if type(ft) == "string" then
            ft = { package.ft }
          else
            ft = package.ft
          end
          vim.api.nvim_create_autocmd("BufEnter", {
            group = augroup,
            callback = function()
              local buf_filetype = vim.opt.filetype:get()
              if vim.list_contains(ft, buf_filetype) then
                package.config()
              end
            end
          })
        elseif package.cmd then
        end
      else
        vim.api.nvim_create_autocmd("VimEnter", {
          group = augroup,
          callback = package.config
        })
      end
    end
  end

  require("paq")(paqs)
  return self
end

setmetatable(paqa, meta)

return paqa
