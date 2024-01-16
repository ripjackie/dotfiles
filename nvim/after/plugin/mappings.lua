local vim = vim
local wk = require("which-key")

--stylua: ignore
wk.register({
  ["<leader>"] = {
    x = { vim.cmd.bdelete, "Delete Buffer" },
    t = {
      w = { vim.cmd.Twilight, "Toggle Twilight" },
      h = { vim.cmd.Themery, "Open Themery" },
    },
    e = { vim.cmd.Neotree, "Open &| Focus Neotree" },
    ra = { function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end, "Toggle Relative Number" },
  },
  ["<C-"] = {
    ["n>"] = { function() vim.cmd.Neotree("toggle") end, "Toggle Neotree" },
  },
  ["<Tab>"] = { vim.cmd.bnext, "Next Buffer" },
  ["<S-Tab>"] = { vim.cmd.bprev, "Prev Buffer" },
})
