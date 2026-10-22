require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
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
})
