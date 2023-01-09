local M = {
	"ahmedkhalf/project.nvim",
	lazy = false,
	config = function()
		require("project_nvim").setup({
			ignore_lsp = { "sumneko_lua" },
			scope_chdir = "global",
			patterns = { ".config", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
			manual = true,
		})
	end,
}

return M
