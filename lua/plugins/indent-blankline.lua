local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,

        filetype_exclude = {
          "help",
          "terminal",
          "alpha",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "nvchad_cheatsheet",
          "lsp-installer",
          "norg",
          "Lazy",
          "mason",
          "OverseerForm",
          ""
        },
    }
  end
}

return M
