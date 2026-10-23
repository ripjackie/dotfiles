vim.g.mapleader = " "

vim.pack.add({
  -- Colorschemes
  { src = "gh:catppuccin/nvim", name = "catppuccin" },
  -- Basic Dependencies
  "gh:nvim-tree/nvim-web-devicons",
  -- Functionality
  "gh:stevearc/oil.nvim",
  "cb:andyg/leap.nvim",
  "gh:qwavies/smart-backspace.nvim",
  -- Completion
  { src = "gh:L3MON4D3/LuaSnip", version = vim.version.range("v2.*") },
  "gh:rafamadriz/friendly-snippets",
  { src = "gh:saghen/blink.cmp", version = vim.version.range("1.*") },
  -- LSP
  "gh:neovim/nvim-lspconfig",
  "gh:Wansmer/symbol-usage.nvim",
  "gh:sontungexpt/better-diagnostic-virtual-text",
  "gh:folke/trouble.nvim",
  "gh:romus204/tree-sitter-manager.nvim",
  -- Visuals
  -- "gh:lukas-reineke/indent-blankline.nvim",
  "gh:shellRaining/hlchunk.nvim",
  "gh:lewis6991/gitsigns.nvim",
  "gh:rachartier/tiny-glimmer.nvim",
  "gh:nvim-lualine/lualine.nvim",
  "gh:j-hui/fidget.nvim",
  -- DAP
  "gh:mfussenegger/nvim-dap",
  { src = "gh:igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
})

local plugin_configs = {
  oil = {},
  -- ibl = {},
  hlchunk = {
    line_num = {
      enable = true
    },
    chunk = {
      enable = true
    }
  },
  gitsigns = {},
  ["tiny-glimmer"] = {},
  lualine = {},
  fidget = {},
  ["tree-sitter-manager"] = {
    ensure_installed = {
      "c", "cpp", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc"
    },
    auto_install = true
  },
  ["smart-backspace"] = {}
}

for plug, conf in pairs(plugin_configs) do
  require(plug).setup(conf)
end

require("core.options")
require("core.keymaps")
require("configs.blink_cmp")
require("configs.lspconfig")
require("configs.dapconfig")

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    require("better-diagnostic-virtual-text").setup()
    require("symbol-usage").setup()
    require("trouble").setup()
  end
})

vim.cmd.colorscheme("catppuccin-mocha")
