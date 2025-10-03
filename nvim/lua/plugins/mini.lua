return {
  "echasnovski/mini.nvim",
  config = function()
    -- require("mini.tabline").setup()
    -- require("mini.statusline").setup()
    -- require("mini.completion").setup()
    require("mini.comment").setup()
    require("mini.pick").setup()
    require("mini.bufremove").setup({
      silent = true
    })
  end
}
