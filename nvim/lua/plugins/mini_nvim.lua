return {
  {
    "echasnovski/mini.nvim",
    config = function ()
      require("mini.comment").setup({})
      require("mini.tabline").setup({})
      require("mini.statusline").setup({})
      -- require("mini.surround").setup({})
    end
  }
}
