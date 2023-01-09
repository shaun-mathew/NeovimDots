local Comment_nvim = {
	"numToStr/Comment.nvim",
	--[[ keys = {"gc", "gb"}, ]]
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("Comment").setup({
			pre_hook = function(ctx)
				local U = require("Comment.utils")
				local location = nil
				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
				})
			end,
			extended = true,
		})
	end,
}

local neogen = {
	"danymat/neogen",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	cmd = { "Neogen" },
	config = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
		})
	end,
}

M = { Comment_nvim, neogen }

return M
