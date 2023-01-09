return {
	"brooth/far.vim",
	cmd = { "Far", "F", "Farr", "Farf", "Fardo", "Farundo", "Refar" },
	config = function()
		vim.cmd("let g:far#enable_undo=1")
	end,
}
