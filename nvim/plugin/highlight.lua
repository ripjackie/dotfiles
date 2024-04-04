local vim = vim

---@param name string
---@param opts {fg: any, bg: any, ctermfg: any, ctermbg: any}
local function hl(name, opts)
  local hlgroup = vim.api.nvim_get_hl(0, { name = name })
  hlgroup = vim.tbl_extend("force", hlgroup, opts)
  vim.api.nvim_set_hl(0, name, hlgroup)
end

hl("FloatBorder", { bg = "none" })
