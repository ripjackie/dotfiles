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
  {
    "zaldih/themery.nvim",
    config = function()
      require("themery").setup({
        themes = require("themes"),
        themeConfigFile = vim.fn.stdpath("config") .. "/plugin/theme.lua",
        livePreview = true
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim", "vimdoc", "markdown", "markdown_inline",
          "python", "lua"
        },
        highlight        = { enable = true },
        indent           = { enable = true },
        endwise          = { enable = true }
      })
    end
  },
  "RRethy/nvim-treesitter-endwise",

  {
    "altermo/ultimate-autopair.nvim",
    branch = "v0.6",
    config = function()
      require("ultimate-autopair").setup({})
    end
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end
  },

  -- { "ms-jpq/coq_nvim",       branch = "coq" },
  -- { "ms-jpq/coq.artifacts",  branch = "artifacts" },
  -- { "ms-jpq/coq.thirdparty", branch = "3p" },

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",

  "rafamadriz/friendly-snippets",
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("lua", { "luadoc" })
    end
  },
  "saadparwaiz1/cmp_luasnip"
})
