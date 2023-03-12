local nvim_cmp = require("plugins.lsp.nvim-cmp")
local lsp_signature = require("plugins.lsp.x_lsp_signature")
local nls = require("plugins.lsp.null_ls")
local lspsaga = require("plugins.lsp.lspsaga")
local trouble = require("plugins.lsp.trouble")

local mason = {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUninstallAll", "MasonLog", "MasonUninstall" },
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}

local mason_lspconfig = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("mason")
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})
	end,
}

local nvim_lspconfig = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	config = function()
		require("mason")
		local server_configurations = require("plugins.lsp.server_configurations")
		local on_attach = server_configurations.on_attach
		local capabilities = server_configurations.capabilities
		local disabled_servers = { "rust_analyzer" }
		-- Automatic server configuration on install
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				if not vim.tbl_contains(disabled_servers, server_name) then
					local opts = {
						on_attach = on_attach,
						capabilities = capabilities,
						flags = {
							debounce_text_changes = 150,
						},
					}

					require("lspconfig")[server_name].setup(opts)
				end
			end,
		})

		-- NOTE: If you want to manually specify configurations, do it in this file
		server_configurations.setup()
		nls.setup()

		--[[ nls.config({on_attach = on_attach}) ]]
		--[[ vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { ]]
		--[[   border = "rounded", ]]
		--[[ }) ]]
		--[[]]
		--[[ vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { ]]
		--[[   border = "rounded", ]]
		--[[ }) ]]
	end,
}

local M = { mason, mason_lspconfig, nvim_lspconfig, nvim_cmp, lsp_signature, nls, lspsaga, trouble }

return M
