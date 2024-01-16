---@class Package
---@field opt boolean
---@field event string | string[]
---@field ft string | table
---@field cmd string | string[]
---@field config function?

local paqa = {}

local meta = {}

---@param packages Package[]?
function meta:__call(packages)
  if not packages then return end

  local paqs = {}

  local on_start_augroup = vim.api.nvim_create_augroup("PaqaOnStartGroup", { clear = true })
  local event_augroup = vim.api.nvim_create_augroup("PaqaEventGroup", { clear = true })
  local ft_augroup = vim.api.nvim_create_augroup("PaqaFtGroup", { clear = true })


  for _, package in ipairs(packages) do
    table.insert(paqs, package)
    local pt = type(package)
    if pt ~= "string" and package.config then
      if package.opt then
        if package.event then
          vim.api.nvim_create_autocmd(package.event, {
            desc = package[1],
            group = event_augroup,
            callback = package.config
          })
        elseif package.ft then
          vim.api.nvim_create_autocmd("BufEnter", {
            desc = package[1],
            group = ft_augroup,
            callback = function (opts)
              local filetypes = type(package.ft) == "table" and package.ft or {package.ft}
              if vim.list_contains(package.ft, vim.bo[opts.buf].filetype) then
                package.config()
              end
            end
          })
        elseif package.cmd then
        end
      else
        vim.api.nvim_create_autocmd("VimEnter", {
          desc = package[1],
          group = on_start_augroup,
          callback = package.config
        })
      end
    end
    if type(package) ~= "string" and package.config and package.opt then
      if package.event then

        if type(package_event) == "string" then ---@cast package_event string
            vim.api.nvim_create_autocmd(package_event, {
              desc = package[1],
              group = event_augroup,
              callback = package.config
            })
        elseif type(package_event) == "table" then ---@cast package_event string[]
          for _, event in ipairs(package_event) do
            vim.api.nvim_create_autocmd(event, {
              desc = package[1],
              group = event_augroup,
              callback = package.config
            })
          end
        end

      elseif package.ft then
        vim.api.nvim_create_autocmd("BufEnter", {
          desc = package[1],
          group = ft_augroup,
          callback = function(opts)
            if vim.bo[opts.buf].filetype == package.ft then
              package.config()
            end
          end
        })
      elseif package.cmd then vim.api.nvim_create_user_command() end
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

