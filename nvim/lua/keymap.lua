local vim = vim
local map = require("nx.map")

map({
  { { "<leader>x", "<leader>bd" }, vim.cmd.Bdelete },
  { "<leader>bn",                  vim.cmd.enew },
  { "<Tab>",                       vim.cmd.bnext },
  { "<S-Tab>",                     vim.cmd.bprev },
  { "<leader>c",                   function() return vim.cmd.Neoconf "global" end },
  { "<C-n>", function()
    vim.cmd.Neotree({ "toggle", "float", "reveal", "reveal_force_cwd" })
  end },
  { "<leader>e",  function() return vim.cmd.Neotree({ "focus", "right" }) end },
  { "K",          function() return vim.cmd.LspUI "hover" end },
  { "<leader>ca", function() return vim.cmd.LspUI "code_action" end }
})

map({
  { '<', "<gv" },
  { '>', ">gv" }
}, { mode = 'v' })
