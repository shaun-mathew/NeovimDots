local M = {
	"nvim-tree/nvim-tree.lua",
	enabled = false,
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local opts = {
			git = {
				enable = true,
			},

			view = {
				mappings = {
					custom_only = false,
					list = {
						{ key = "<C-e>", action = "", action_cb = "" },
					},
				},
			},

			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
					glyphs = {
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							untracked = "U",
							ignored = "◌",
						},
					},
				},
			},
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		}

		require("nvim-tree").setup(opts)
	end,
}

return M
