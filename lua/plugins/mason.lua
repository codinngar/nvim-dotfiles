return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Language Servers
		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"ts_ls",
				"jsonls",
				"lua_ls",
				"eslint",
				"emmet_ls",
				"tailwindcss",
			},
		})

		-- Formatters
		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"eslint_d",
			},
		})
	end,
}
