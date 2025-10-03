return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*"
    },
    "rafamadriz/friendly-snippets",
  },
  version = "1.*",
  opts = {
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" }
    },
    completion = {
      list = {
        selection = {
          preselect = false
        },
      },
    },
    cmdline = {
      completion = {
        menu = {
          auto_show = true
        }
      }
    }
  }
}
