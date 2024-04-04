local vim = vim
local nx = { map = require("nx.map") }

nx.map({
  { { "<leader>x", "<leader>bd" }, vim.cmd.Bdelete },
  { "<Tab>",                       vim.cmd.bnext },
  { "<S-Tab>",                     vim.cmd.bprev },
  { "<leader>bn",                  vim.cmd.enew },
  { "<leader>c",                   function() return vim.cmd.Neoconf "global" end },
  { "<C-n>", function()
    vim.cmd.Neotree({ "toggle", "float", "reveal", "reveal_force_cwd" })
  end },
  { "<leader>e",  function() return vim.cmd.Neotree({ "focus", "right" }) end },
  -- { "K",          function() return vim.cmd.LspUI "hover" end },
  { "<leader>ca", function() return vim.cmd.LspUI "code_action" end },
  { 'H',          "<cmd>HopChar2<cr>" },
  { "<leader>d",  function() return require("dapui").toggle() end },

})

nx.map({
  { '<', "<gv" },
  { '>', ">gv" },
  { "J", ":move '>+1<CR>gv=gv" },
  { "K", ":move '<-2<CR>gv=gv" }
}, { mode = 'v' })
