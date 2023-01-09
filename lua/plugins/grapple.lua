return {
	"cbochs/grapple.nvim",
	keys = { "<leader>j" },
	cmd = { "GrappleTag", "GrappleToggle", "GrappleSelect" },
	config = function()
		require("grapple").setup()
	end,
}
