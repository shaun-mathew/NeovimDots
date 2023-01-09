local tokyonight = {
  "folke/tokyonight.nvim",
  theme_name = "tokyonight",
}

local catppuccin = {
  "catppuccin/nvim",
  theme_name = "catppuccin",
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  theme_name = "kanagawa",
  primary = true,
}

local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  theme_name = "gruvbox",
}

local rosepine = {
  "rose-pine/neovim",
  theme_name = "rosepine",
}

local oxocarbon = {
  "nyoom-engineering/oxocarbon.nvim",
  theme_name = "oxocarbon",
}

local themes = { tokyonight, catppuccin, kanagawa, gruvbox, rosepine, oxocarbon }

for i,theme in pairs(themes) do
  if vim.tbl_get(theme, "primary") then
    theme = vim.tbl_deep_extend("keep", theme, {
      lazy = false,
      priority = 999,
      config = function()
        vim.cmd("colorscheme " .. vim.tbl_get(theme, "theme_name"))
      end
    })
    themes[i] = theme
  else
    theme = vim.tbl_deep_extend("keep", theme, {
      event = "VeryLazy"
    })

    themes[i] = theme
  end
end

return themes
