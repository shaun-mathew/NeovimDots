-- TODO: replace this with grapple
return {
	"ThePrimeagen/harpoon",
	cmd = { "HarpoonToggle", "HarpoonNext", "HarpoonPrev", "HarpoonNav", "HarpoonAddFile" },
	config = function()
		vim.api.nvim_create_user_command("HarpoonToggle", function()
			require("harpoon.ui").toggle_quick_menu()
		end, {})

		vim.api.nvim_create_user_command("HarpoonPrev", function()
			require("harpoon.ui").nav_prev()
		end, {})

		vim.api.nvim_create_user_command("HarpoonNext", function()
			require("harpoon.ui").nav_next()
		end, {})

		vim.api.nvim_create_user_command("HarpoonNav", function(opts)
			pcall(require("harpoon.ui").nav_file, tonumber(opts.args))
		end, { nargs = 1 })

		vim.api.nvim_create_user_command("HarpoonAddFile", function()
			require("harpoon.mark").add_file()
		end, {})
	end,
}
