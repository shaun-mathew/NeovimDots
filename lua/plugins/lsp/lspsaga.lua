return {
	"glepnir/lspsaga.nvim",
	cmd = { "Lspsaga" },
	config = function()
		local saga = require("lspsaga")
		saga.init_lsp_saga()
	end,
}
