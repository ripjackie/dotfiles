return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "c", "lua", "python", "vim", "vimdoc", "query" },
    highlight = { enable = true },
    indent = { enable = true }
  }
}
