
local diffview = {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  config = function()
    require("diffview").setup()
  end
}


local neogit = {
  "TimUntersberger/neogit",
  dependencies = { "plenary.nvim" },
  cmd = { "Neogit" },
  config = function()
    require("neogit").setup()
  end
}

local lazygit = {
  "kdheepak/lazygit.nvim",
  cmd = { "LazyGit" }
}

local gitsigns = {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup()
  end
}

local git = { diffview, neogit, lazygit, gitsigns }

return git

