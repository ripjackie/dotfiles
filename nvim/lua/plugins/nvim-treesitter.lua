return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "lua", "python", "json", "yaml", "toml",
        "vim", "vimdoc", "query", "luadoc"
      },
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
    })
  end
}
