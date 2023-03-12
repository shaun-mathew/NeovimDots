local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-textsubjects",
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"python",
				"html",
				"css",
				"typescript",
				"javascript",
				"go",
				"rust",
				"c",
				"cpp",
				"vim",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = false,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},

			endwise = {
				enable = true,
			},

			autotag = {
				enable = true,
			},

			textsubjects = {
				enable = true,
				prev_selection = ",",

				keymaps = {
					["."] = "textsubjects-smart",
					["/"] = "textsubjects-container-outer",
					["i/"] = "textsubjects-container-inner",
				},
			},

			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@call.outer",
						["ic"] = "@call.inner",
						["aC"] = "@class.outer",
						["iC"] = "@class.inner",
						["uc"] = "@comment.outer",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",
						["aP"] = "@parameter.outer",
						["iP"] = "@parameter.inner",
						["aS"] = "@statement.outer",
						["iS"] = "@statement.outer",
					},
					-- You can choose the select mode (default is charwise 'v')
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		})
	end,
}
local autopairs = {
	"windwp/nvim-autopairs",
	event = "VeryLazy",
	config = function()
		require("nvim-autopairs").setup({
			disable_in_visualblock = true,
			enable_bracket_in_quote = false,
			fast_wrap = {},
		})
	end,
}

local treesitter_context = {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
	config = function()
		require("treesitter-context").setup({
			default = {
				"class",
				"function",
				"method",
				"for",
				"while",
				"if",
				"else",
				"switch",
				"case",
			},
			rust = {
				"impl_item",
				"mod_item",
				"enum_item",
				"match",
				"struct",
				"loop",
				"closure",
				"async_block",
				"block",
			},
			python = {
				"elif",
				"with",
				"try",
				"except",
			},
			json = {
				"object",
				"pair",
			},
			javascript = {
				"object",
				"pair",
			},
			yaml = {
				"block_mapping_pair",
				"block_sequence_item",
			},
			toml = {
				"table",
				"pair",
			},
			markdown = {
				"section",
			},
		})
	end,
}

local M = { treesitter, autopairs, treesitter_context }

return M
