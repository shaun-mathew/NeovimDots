local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	change_detection = {
		enabled = false,
		notify = true,
	},
	readme = {
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md" },
		skip_if_doc_exists = true,
	},
})
