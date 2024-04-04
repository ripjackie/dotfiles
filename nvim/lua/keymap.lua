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
nx.map {
  { "K",          function() return vim.cmd.LspUI "hover" end },
  { "<leader>ca", function() return vim.cmd.LspUI "code_action" end },
}

-- Hop
nx.map { 'H', vim.cmd.HopChar2 }

-- DAP
nx.map { "<leader>d", function() return require("dapui").toggle() end }

-- Visual
nx.map({
  { '<', "<gv" },
  { '>', ">gv" },
  { "J", ":move '>+1<CR>gv=gv" },
  { "K", ":move '<-2<CR>gv=gv" }
}, { mode = 'v' })
