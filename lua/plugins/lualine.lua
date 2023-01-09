local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("lualine").setup({
		options = {
			disabled_filetypes = { "alpha", "NvimTree", "TelescopePrompt" },
		},
	})
end

return M
