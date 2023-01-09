local M = {
  "ggandor/leap.nvim",
  keys = { "s", "S", "gs" },
  dependencies = { { "tpope/vim-repeat", keys = { "." } } },
  config = function()
    require("leap").set_default_keymaps() 
    vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#707070" })
  end
}

return M
