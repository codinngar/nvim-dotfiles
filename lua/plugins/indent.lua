-- return {
-- 	"echasnovski/mini.indentscope",
-- 	event = "VeryLazy",
-- 	version = false,
-- 	config = function()
-- 		require("mini.indentscope").setup({
-- 			symbol = "│",
-- 			draw = {
-- 				delay = 0,
-- 			},
-- 		})
-- 	end,
-- }

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = { char = "┊" },
			scope = { enabled = false },
		})
	end,
}
