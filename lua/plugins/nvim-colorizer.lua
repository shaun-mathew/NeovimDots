return {
  "NvChad/nvim-colorizer.lua",
  ft = {"html", "css", "sass", "scss"},
  config = function()
    require("colorizer").setup{
      user_default_options = {
        tailwind = true,
        mode = "virtualtext"
      }
    }
  end
}
