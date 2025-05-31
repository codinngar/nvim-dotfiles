return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			direction = "vertical",
			size = 50,
		})

		vim.keymap.set(
			"n",
			"<leader>h",
			"<cmd>ToggleTerm size=15 direction=horizontal<cr>",
			{ silent = true, desc = "Toggle horizontal terminal" }
		)
		vim.keymap.set(
			"n",
			"<leader>v",
			"<cmd>ToggleTerm size=50 direction=vertical<cr>",
			{ silent = true, desc = "Toggle vertical terminal" }
		)
		vim.keymap.set(
			"n",
			"<leader>f",
			"<cmd>ToggleTerm direction=float<cr>",
			{ silent = true, desc = "Toggle vertical terminal" }
		)

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
	end,
}
