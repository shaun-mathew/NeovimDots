return {
	"simrat39/rust-tools.nvim",
	ft = { "rust", "rs" },
	config = function()
		require("rust-tools").setup()
		require("rust-tools").inlay_hints.set()
	end,
}
