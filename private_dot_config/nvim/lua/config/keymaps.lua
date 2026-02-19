-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ve", ":e $MYVIMRC<cr>", { desc = "Edit $MYVIMRC", silent = true })
vim.keymap.set("n", "<leader>vs", ":source $MYVIMRC<cr>", { desc = "Source $MYVIMRC", silent = true })
vim.keymap.set("v", "S", "<Plug>(nvim-surround-visual)")

vim.keymap.del("n", "<leader>l")

-- Bufferline
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- Tab Navigation
vim.keymap.set("n", "[t", ":tabp<CR>", { desc = "Move to previous tab" })
vim.keymap.set("n", "]t", ":tabn<CR>", { desc = "Move to next tab" })

-- Fugitive
vim.keymap.set("n", "<leader>go", ":Gedit :<cr>", { desc = "Fugitive", silent = true })
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { desc = "Git Blame", silent = true })
