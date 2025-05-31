return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
					zindex = 1001,
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
					zindex = 1001,
				},
			},

			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}

-- return {
-- 	"saghen/blink.cmp",
-- 	dependencies = {
-- 		"rafamadriz/friendly-snippets",
-- 		"L3MON4D3/LuaSnip",
-- 	},
-- 	config = function()
-- 		require("blink-cmp").setup({
-- 			completion = {
-- 				ghost_text = { enabled = true },
-- 				menu = {
-- 					enabled = true,
-- 					min_width = 20,
-- 					max_height = 30,
-- 					border = "rounded", -- Options: 'none', 'single', 'double', 'rounded', 'padded'
-- 					winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection",
-- 				},
-- 				documentation = {
-- 					window = {
-- 						min_width = 20,
-- 						max_width = 60,
-- 						max_height = 15,
-- 						border = "rounded",
-- 						winblend = 10,
-- 						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
-- 						scrollbar = true,
-- 					},
-- 				},
-- 			},
-- 			keymap = {
-- 				["<C-space>"] = { "show" },
-- 				["<C-j>"] = { "select_next" },
-- 				["<C-k>"] = { "select_prev" },
-- 				["<C-l>"] = { "show_documentation" },
-- 				["<C-h>"] = { "hide_documentation" },
-- 				["<cr>"] = { "select_and_accept", "fallback" },
-- 			},
-- 		})
-- 	end,
-- }
