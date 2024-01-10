local vim = vim

local plugins = {

  -- Overrides

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      endwise = { enable = true },
      ensure_installed = {
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "go",
        "python",
      },
    },
  },

  -- Plugin Replacements
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
    config = function(_, opts)
      local registry = require("mason-registry")
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          local installed = registry.get_installed_package_names()
          local function hasValue(array, value)
            for _, v in pairs(array) do
              if v == value then
                return true
              end
            end
            return false
          end

          for _, value in pairs(opts.ensure_installed) do
            if not hasValue(registry, value) then
              local pkg = registry.get_package(value)
              vim.notify("Automatically Installing " .. pkg.name)
              pkg:install():once(
                "closed",
                vim.schedule_wrap(function()
                  vim.notify(pkg.name .. " Installed Successfully")
                end)
              )
            end
          end
          for _, value in pairs(installed) do
            if not hasValue(opts.ensure_installed, value) then
              -- uninstall
            end
          end
        end,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "selene",
        "stylua",
        -- go
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        -- python
        "python-lsp-server",
        "pyright",
      },
      auto_update = true,
    },
  },

  {
    "altermo/ultimate-autopair.nvim",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      { "windwp/nvim-autopairs", enabled = false },
    },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "junnplus/lsp-setup.nvim",
        dependencies = {
          "folke/neodev.nvim",
        },
        config = function()
          require("custom.configs.lsp-setup")
        end,
      },
    },
    config = function() end,
  },

  -- Custom Plugins

  {
    "mfussenegger/nvim-dap",
  },

  {
    "nvimtools/none-ls.nvim",
    ft = { "go", "lua", "python" },
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },

  {
    "utilyre/barbecue.nvim",
    lazy = true,
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
      "Nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "LspAttach",
    tag = "v1.1.0",
    opts = {},
  },

  {
    "m-demare/hlargs.nvim",
    lazy = true,
    event = "LspAttach",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    lazy = true,
    event = "InsertEnter",
    version = "*",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}

return plugins
