local M = {
	"Shatur/neovim-session-manager",
	lazy = false,
	config = function()
		require("session_manager").setup({
			autosave_ignore_filetypes = { "gitcommit", "NvimTree" },
			autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
		})
	end,
}

return M
