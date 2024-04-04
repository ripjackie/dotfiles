return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  version = "v0.6",
  opts = {
    bs = {
      space = "balance",
      indent_ignore = true,
      single_delete = true
    },
    cr = {
      autoclose = true
    },
    space2 = {
      enable = true
    },
    tabout = {
      enable = true,
      hopout = true
    }
  }
}
