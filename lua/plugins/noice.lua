return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				progress = {
					enabled = false,
				},
			},
		})

		vim.keymap.set("n", "md", "<cmd>Noice dismiss<cr>", { silent = true, desc = "Dismess messages" })
	end,
}
