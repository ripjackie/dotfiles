vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = vim.version.range("v2.*")
  },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("v1.*")
  }
})

require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
  snippets = {
    preset = "luasnip"
  },
  keymap = {
    preset = "default",
    ["<CR>"] = {
      "accept",
      "fallback"
    },
    ["<Tab>"] = {
      "select_next",
      'snippet_forward',
      'fallback'
    },
    ["<S-Tab>"] = {
      "snippet_backward",
      "select_prev",
      "fallback"
    }
  },
  signature = {
    enabled = true,
    window = {
      show_documentation = false
    }
  },
  completion = {
    documentation = {
      auto_show = true
    },
    list = {
      selection = {
        auto_insert = true,
        preselect = function()
          return not require('blink.cmp').snippet_active({ direction = 1 })
        end
      }
    }
  }
})
