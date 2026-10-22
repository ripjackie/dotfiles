vim.g.mapleader = " "

vim.pack.add({
  -- Colorschemes
  { src = "gh:catppuccin/nvim", name = "catppuccin" },
  -- Basic Dependencies
  "gh:nvim-tree/nvim-web-devicons",
  -- Functionality
  "gh:stevearc/oil.nvim",
  -- Completion
  { src = "gh:L3MON4D3/LuaSnip", version = vim.version.range("v2.*") },
  "gh:rafamadriz/friendly-snippets",
  { src = "gh:saghen/blink.cmp", version = vim.version.range("1.*") },
  -- LSP
  "gh:neovim/nvim-lspconfig",
  "gh:Wansmer/symbol-usage.nvim",
  "gh:sontungexpt/better-diagnostic-virtual-text",
  "gh:folke/trouble.nvim",
  -- Visuals
  "gh:lukas-reineke/indent-blankline.nvim",
  "gh:lewis6991/gitsigns.nvim",
  "gh:rachartier/tiny-glimmer.nvim",
  "gh:nvim-lualine/lualine.nvim",
  "gh:j-hui/fidget.nvim",
  -- DAP
  "gh:mfussenegger/nvim-dap",
  { src = "gh:igorlfs/nvim-dap-view", version = vim.version.range("1.*") }
})

require("oil").setup()
require("ibl").setup()
require("gitsigns").setup()
require("tiny-glimmer").setup()
require("lualine").setup()
require("fidget").setup()

require("core.options")
require("core.keymaps")
require("configs.blink_cmp")
require("configs.lspconfig")

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    require("better-diagnostic-virtual-text").setup()
    require("symbol-usage").setup()
    require("trouble").setup()
  end
})

vim.cmd.colorscheme("catppuccin-mocha")
