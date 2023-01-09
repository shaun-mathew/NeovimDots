local M = {
	"utilyre/barbecue.nvim",
	branch = "dev", -- omit this if you only want stable updates
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"smiteshp/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		require("barbecue").setup()
	end,
}

return M
