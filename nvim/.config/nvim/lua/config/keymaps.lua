-- Caps Lock navigation
vim.keymap.set({ "n", "v" }, "<D-A-C-S-i>", "k", { desc = "Move up" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-j>", "h", { desc = "Move left" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-k>", "j", { desc = "Move down" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-l>", "l", { desc = "Move right" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-u>", "b", { desc = "Move left to next word" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-o>", "e", { desc = "Move right to next word" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-H>", "5k", { desc = "Move up 5 lines" })
vim.keymap.set({ "n", "v" }, "<D-A-C-S-semicolon", "5j", { desc = "Move down 5 lines" }) -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
