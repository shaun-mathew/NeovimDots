return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		{ "rafamadriz/friendly-snippets", event = "InsertEnter" },
	},
	config = function()
		require("luasnip").config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path or "" })
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
