return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "luap",
      "luadoc",
      "c",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "markdown",
      "markdown_inline",
      "python",
      "c_sharp",
    },
    highlight = {
      enable = true,
      enable_additional_vim_regex_highlighting = false,
    },
    indent = { enable = false },
  },
}
