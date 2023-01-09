local M = {
  "max397574/better-escape.nvim",
  lazy = false,
  config = function()
    require("better_escape").setup({
      mapping = { "jk", "kj" },
      timeout = 100,
      clear_empty_lines = true,
      keys = "<Esc>"
    })
  end
}

return M
