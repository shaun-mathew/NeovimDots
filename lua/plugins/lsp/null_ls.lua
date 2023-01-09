local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

M.setup = function()
	local nls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	nls.setup({
		debounce = 150,
		save_after_format = true,
		sources = {
			-- nls.builtins.formatting.prettierd,
			nls.builtins.formatting.stylua,
			nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
			nls.builtins.formatting.rustfmt,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
		--[[ root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"), ]]
	})
end

M.has_formatter = function(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
