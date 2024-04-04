return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  version = "0.1.x",
  opts = {
    pickers = {
      find_files = {
        mappings = {
          n = {
            ["<BS>"] = function(prompt_bufnr)
              local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
              local cwd = tostring(vim.uv.cwd())
              local parent = tostring(vim.fs.dirname(cwd))

              require("telescope.actions").close(prompt_bufnr)
              require("telescope.builtin").find_files({
                prompt_title = vim.fs.basename(parent),
                cwd = parent
              })
            end
          }
        }
      }
    }
  }
}
