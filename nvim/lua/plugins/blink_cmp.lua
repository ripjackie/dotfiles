return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*"
    },
    "rafamadriz/friendly-snippets",
    "Fildo7525/pretty_hover",
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
      documentation = {
        draw = function(opts)
          if opts.item and opts.item.documentation and opts.item.documentation.value then
            local out = require("pretty_hover.parser").parse(opts.item.documentation.value)
            opts.item.documentation.value = out:string()
          end

          opts.default_implementation(opts)
        end,
        auto_show = true
      }
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
