return {
	"glepnir/lspsaga.nvim",
	cmd = { "Lspsaga" },
	config = function()
		local saga = require("lspsaga")
		saga.setup()
	end,
}
