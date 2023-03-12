local M = {}

M.servers = {
	bashls = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	},
}

M.on_attach = function(client, bufnr)
	require("lsp_signature").on_attach({}, bufnr)

	local lsp_mappings = {
		g = {
			name = "g",
			d = { "<cmd>Lspsaga lsp_finder<cr>", "Goto Definition" },
			D = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
			l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
			r = { "<cmd>Lspsaga rename<cr>", "Rename" },
		},
		["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
		["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
		["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
		["<leader>"] = {
			l = {
				name = "LSP",
				a = { "<cmd> Lspsaga code_action<CR>", "Code Action" },
				o = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" },
			},
			f = {
				l = {
					name = "LSP",
					d = { "<cmd>Telescope lsp_definitions <CR>", "Goto Definition" },
					i = { "<cmd>Telescope lsp_incoming_calls<CR>", "Incoming Calls" },
					o = { "<cmd>Telescope lsp_outgoing_calls<CR>", "Outgoing Calls" },
					r = { "<cmd>Telescope lsp_references<cr>", "References" },
					t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
					D = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
					W = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
				},
			},
		},
	}

	local wk = require("which-key")
	wk.register(lsp_mappings, { buffer = bufnr, remap = false })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
M.capabilities = capabilities

M.flags = {
	debounce_text_changes = 150,
}

M.setup = function()
	local options = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		flags = M.flags,
	}

	for server, opts in pairs(M.servers) do
		opts = vim.tbl_deep_extend("force", {}, options, opts or {})
		require("lspconfig")[server].setup(opts)
	end
end

return M
