vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", ";", ":")

vim.keymap.set("n", "<leader>w", "<CMD>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<CMD>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sc", "<CMD>close<CR>", { desc = "Close current split" })

-- Tabs
vim.keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<CMD>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<CMD>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<CMD>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Navigation
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate up" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate down" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate right" })

-- Sizes
vim.keymap.set("n", "<C-Up>", "<CMD>resize +1<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", "<CMD>resize -1<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<C-Left>", "<CMD>vertical resize -1<CR>", { desc = "Resize left" })
vim.keymap.set("n", "<C-Right>", "<CMD>vertical resize +1<CR>", { desc = "Resize right" })
