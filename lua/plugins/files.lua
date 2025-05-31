return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			diagnostics = {
				enable = true,
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle()<cr>", { silent = true, desc = "Open file explorer" })
	end,
}
