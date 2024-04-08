local vim = vim
local nx = { map = require("nx.map") }

-- Buffers
nx.map({
  { { "<leader>x", "<leader>bd" }, vim.cmd.Bdelete },
  { "<Tab>",                       vim.cmd.bnext },
  { "<S-Tab>",                     vim.cmd.bprev },
  { "<leader>bn",                  vim.cmd.enew },
})

-- Neoconf
nx.map { "<leader>c", function()
  return vim.cmd.Neoconf "global"
end }

--Neotree
nx.map { "<C-n>", function()
  vim.cmd.Neotree({ "toggle", "float", "reveal", "reveal_force_cwd" })
end }

-- LSP
if vim.fn.has("nvim-0.10") then
  nx.map {
    { "K",          function() return vim.cmd.LspUI "hover" end },
    { "<leader>ca", function() return vim.cmd.LspUI "code_action" end },
    { "<leader>rn", function() return vim.cmd.LspUI "rename" end }
  }
else
  nx.map {
    { "K",          function() return vim.lsp.buf.hover end },
    { "<leader>ca", function() return vim.lsp.buf.code_action end },
    { "<leader>rn", function() return vim.lsp.buf.rename end }
  }
end

-- Hop
nx.map { 'H', vim.cmd.HopChar2 }

-- DAP
nx.map {
  { "<leader>dt", function() return require("dapui").toggle() end },
  { "<leader>db", function() return require("dap").toggle_breakpoint() end },
  { "<leader>dc", function() return require("dap").continue() end },
  { "<leader>do", function() return require("dap").step_over() end },
  { "<leader>di", function() return require("dap").step_into() end },
  { "<leader>dr", function() return require("dap").repl.open() end }
}

-- Visual
nx.map({
  { '<', "<gv" },
  { '>', ">gv" },
  { "J", ":move '>+1<CR>gv=gv" },
  { "K", ":move '<-2<CR>gv=gv" }
}, { mode = 'v' })
