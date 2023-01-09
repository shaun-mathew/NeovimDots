return {
  "kylechui/nvim-surround",
  dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-treesitter/nvim-treesitter-textobjects"},
  keys = {"ys", "cs", "ds"},
  config = function()
    require("nvim-surround").setup({})
  end
}
