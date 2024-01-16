local vim = vim

local paqpath = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
if not vim.loop.fs_stat(paqpath) then
  vim.fn.system({
    "git", "clone", "--depth=1",
    "https://github.com/savq/paq-nvim.git",
    paqpath
  })
end

require("paqa")({
  "savq/paq-nvim",

  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "folke/neodev.nvim",
  "junnplus/lsp-setup.nvim",

  "sainnhe/everforest",
  "zaldih/themery.nvim",

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "RRethy/nvim-treesitter-endwise",

  {
    "altermo/ultimate-autopair.nvim",
    branch = "v0.6",
    config = function()
      require("ultimate-autopair").setup({})
    end
  },

  "j-hui/fidget.nvim",

  -- { "ms-jpq/coq_nvim",       branch = "coq" },
  -- { "ms-jpq/coq.artifacts",  branch = "artifacts" },
  -- { "ms-jpq/coq.thirdparty", branch = "3p" },

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",

  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip"
})
