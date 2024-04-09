local ts = require("telescope.builtin")

return {
  { "<leader>ff", ts.find_files },
  { "<leader>fg", ts.live_grep }
}
