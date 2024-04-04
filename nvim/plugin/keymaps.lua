local vim = vim
local wk = require("which-key")
local ts = require("telescope.builtin")


print(vim.fn.getcwd(0, 0))


wk.register({
  ["<leader>t"] = {
    name = "+Telescope",
    f = { ts.find_files, "Find Files" },
    g = { ts.live_grep, "Live Grep" },
    b = { ts.buffers, "Buffers" },
    h = { ts.help_tags, "Help tags" }
  },
  ["<leader>x"] = { vim.cmd.Bdelete, "Delete buffer" },
  ["<leader>c"] = { "<cmd>Neoconf global<cr>", "Open Neoconf global config" },
  ["<Tab>"] = { vim.cmd.bnext, "goto next buffer" },
  ["<S-Tab>"] = { vim.cmd.bprev, "goto prev buffer" },
  ["<C-n>"] = { function() vim.cmd.Neotree({ "toggle", "right" }) end, "Open neotree" },


  ["1"] = "which_key_ignore",
  ["<"] = { "<gv" },
  [">"] = { ">gv" }
})
