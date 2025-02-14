local vim = vim

local function map(mode, lhs, rhs, opts)
  local default_opts = { silent = true }
  vim.tbl_extend("keep", opts or {}, default_opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Autocmds
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "lua,c,cpp",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ps1",
  callback = function()
    local ps = require("powershell")
    map("n", "<leader>P", function()
      ps.toggle_term()
    end)
    map("n", "<leader>E", function()
      ps.eval()
    end)
  end,
})
