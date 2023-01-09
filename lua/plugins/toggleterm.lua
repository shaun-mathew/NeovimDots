local M = {
	"akinsho/toggleterm.nvim",
	cmd = {
		"ToggleTerm",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
		"ToggleTermSetName",
		"TermExec",
		"ToggleTermToggleAll",
	},
	keys = { "<M-t>" },
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<M-t>]],
			start_in_insert = true,
			-- TODO: Think about autochdir
			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			persist_mode = true,
			insert_mappings = false, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		})
	end,
}

return M
