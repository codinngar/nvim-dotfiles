return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
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
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			window = {
				completion = {
					border = "rounded", -- Options: 'single', 'double', 'rounded', 'solid', 'shadow'
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
					zindex = 1001, -- Ensure it's above other UI elements
				},
				documentation = {
					border = "rounded", -- Similar border options as above
					winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
					zindex = 1001,
				},
			},

			-- configure lspkind for vs-code like pictograms in completion menu
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
